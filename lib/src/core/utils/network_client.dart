import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../models/base/base.dart';
import '../sberbank_acquiring_config.dart';

/// {@template network_client}
/// Класс для работы с сетью
/// {@endtemplate}
class NetworkClient {
  /// {@macro network_client}
  NetworkClient(this._config);

  final SberbankAcquiringConfig _config;

  /// Метод вызывает созданный запрос на Acquiring API
  Future<Response> call<Response extends AcquiringResponse>(
    AcquiringRequest request,
    Response Function(Map<String, dynamic> json) response,
  ) async {
    final SberbankAcquiringConfig config = _config;

    Map<String, String>? proxyHeaders;
    Uri? url;

    if (config is SberbankAcquiringConfigProxy) {
      final ProxyRequest? setting = config.mapping?.call(
        request,
        _config.isDebugMode,
      );

      proxyHeaders = <String, String>{
        ...?config.globalHeaders,
        ...?setting?.headers
      };

      final String? path = setting?.path;
      final String? proxyPath = path != null ? config.proxyPath + path : null;
      url = Uri.https(
        config.proxyDomain,
        proxyPath ?? (config.proxyPath + request.apiMethod),
      );
    }

    final Map<String, String> headers = <String, String>{
      ...request.headers,
      ...?proxyHeaders,
    };

    url ??= Uri.https(
      config.isDebugMode
          ? NetworkSettings.domainDebug
          : NetworkSettings.domainRelease,
      NetworkSettings.apiPath + request.apiMethod,
    );

    final Object? rawRequest = _modifyRequest(request, config);

    config.logger.log(message: url.toString(), name: 'Request URL');
    config.logger.log(message: headers.toString(), name: 'Request headers');
    config.logger.log(message: rawRequest.toString(), name: 'RawRequest');

    http.Response rawResponse;
    try {
      rawResponse = await http
          .post(
            url,
            headers: headers,
            body: rawRequest,
            encoding: Encoding.getByName('UTF-8'),
          )
          .timeout(NetworkSettings.timeout);
    } catch (error, stackTrace) {
      config.logger.log(
        message: '',
        name: 'HTTP Error',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }

    config.logger.log(
      message: '${rawResponse.statusCode} | ${rawResponse.body}',
      name: 'RawResponse',
    );

    if (rawResponse.statusCode != 200) throw rawResponse;

    config.logger.log(message: rawResponse.body, name: 'RawResponse');

    Response? _response;
    final dynamic json = jsonDecode(rawResponse.body);

    if (json is Map) {
      _response = response(json as Map<String, dynamic>);
    } else {
      throw Exception('REST type error');
    }

    config.logger.log(message: _response.toString(), name: 'Response');
    return _response;
  }

  Object? _modifyRequest(
    AcquiringRequest request,
    SberbankAcquiringConfig config,
  ) {
    final Map<String, String?> temp = request.toJson().map<String, String?>(
          (String k, dynamic v) => MapEntry<String, String?>(k, v?.toString()),
        );

    temp.removeWhere((_, String? v) => v == null || v.isEmpty);

    if (config is SberbankAcquiringConfigProxy) return temp;

    if (request.apiMethod != ApiMethods.applePay &&
        request.apiMethod != ApiMethods.googlePay) {
      if (config is SberbankAcquiringConfigCredential) {
        temp.addAll(<String, String>{
          JsonKeys.userName: config.userName,
          JsonKeys.password: config.password,
        });
      }

      if (config is SberbankAcquiringConfigToken) {
        temp.addAll(<String, String>{
          JsonKeys.token: config.token,
        });
      }
    }

    switch (request.headers[NetworkSettings.contentType]) {
      case NetworkSettings.contentTypeFormUrlencoded:
        return temp;
      case NetworkSettings.contentTypeJson:
        return jsonEncode(temp);
      default:
        throw Exception('Content Type not declared');
    }
  }
}

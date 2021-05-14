import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../models/base/acquiring_request.dart';
import '../models/base/acquiring_response.dart';
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
  ) {
    final Completer<Response> _completer = Completer<Response>();

    http
        .post(
          Uri.https(
            _config.debug
                ? NetworkSettings.domainDebug
                : NetworkSettings.domainRelease,
            NetworkSettings.apiPath + request.apiMethod,
          ),
          body: _modifyRequest(request),
          headers: request.headers,
          encoding: Encoding.getByName('UTF-8'),
        )
        .then((http.Response rawResponse) {
          _config.logger
              .log(message: rawResponse.request.toString(), name: 'RawRequest');
          if (rawResponse.statusCode == 200) {
            _config.logger.log(message: rawResponse.body, name: 'RawResponse');

            Response? _response;
            final dynamic json = jsonDecode(rawResponse.body);

            if (json is Map) {
              _response = response(json as Map<String, dynamic>);
            } else {
              Exception('REST type error');
            }

            _config.logger.log(message: _response.toString(), name: 'Response');
            _completer.complete(_response);
          } else {
            _completer.completeError(rawResponse);
          }
        })
        .timeout(NetworkSettings.timeout)
        .catchError((Object error, StackTrace stackTrace) {
          _config.logger.log(
            message: '',
            name: 'HTTP Error',
            error: error,
            stackTrace: stackTrace,
          );
          _completer.completeError(error);
        });

    return _completer.future;
  }

  dynamic _modifyRequest(AcquiringRequest request) {
    final Map<String, String?> temp = request.toJson().map<String, String?>(
        (String k, dynamic v) => MapEntry<String, String?>(k, v?.toString()));

    temp.removeWhere((_, String? v) => v == null || v.isEmpty);

    if (_config.proxyUrl != null) return temp;

    if (request.apiMethod != ApiMethods.applePay &&
        request.apiMethod != ApiMethods.googlePay) {
      final String? userName = _config.userName;
      final String? password = _config.password;
      if (userName != null && password != null) {
        temp.addAll(<String, String>{
          JsonKeys.userName: userName,
          JsonKeys.password: password,
        });
      }

      final String? token = _config.token;
      if (token != null) {
        temp.addAll(<String, String>{
          JsonKeys.token: token,
        });
      }
    }

    switch (request.headers['content-type']) {
      case 'application/x-www-form-urlencoded':
        return temp;
      case 'application/json':
        return jsonEncode(temp);
      default:
        throw Exception('Content Type not declared');
    }
  }
}

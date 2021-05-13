import 'base_request.dart';

/// {@template acquiring_request}
/// Базовый класс создания запроса Acquiring API
/// {@endtemplate}
abstract class AcquiringRequest extends BaseRequest {
  /// Заголовок метода
  Map<String, String> get headers => <String, String>{
        'content-type': 'application/x-www-form-urlencoded',
      };

  /// Метод запроса
  String get apiMethod;
}

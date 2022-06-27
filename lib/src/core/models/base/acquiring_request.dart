import '../../../constants.dart';
import 'base_request.dart';

/// {@template acquiring_request}
/// Базовый класс создания запроса Acquiring API
/// {@endtemplate}
abstract class AcquiringRequest extends BaseRequest {
  /// Заголовок метода
  Map<String, String> get headers => NetworkSettings.baseHeaders;

  /// Метод запроса
  String get apiMethod;
}

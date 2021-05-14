import 'package:comparer/comparer.dart';

/// {@template base_request}
/// Базовый класс запроса Base API
/// {@endtemplate}
abstract class BaseRequest extends ComparerMap {
  @override
  Map<String, Object?> get equals => <String, Object?>{};

  /// {@macro toJson}
  Map<String, dynamic> toJson();

  /// Метод проверяет валидность данных
  void validate();

  /// Создает экземпляр с заданными параметрами
  BaseRequest copyWith();
}

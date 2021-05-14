import 'package:comparer/comparer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/// {@template base_response}
/// Базовый класс ответа Base API
/// {@endtemplate}
@JsonSerializable()
class BaseResponse extends ComparerMap {
  /// {@macro base_response}
  BaseResponse();

  /// {@template fromJson}
  /// Преобразование json в модель
  /// {@endtemplate}
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{};

  /// {@template toJson}
  /// Преобразование модели в json
  /// {@endtemplate}
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

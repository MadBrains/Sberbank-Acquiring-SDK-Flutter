import 'package:json_annotation/json_annotation.dart';

import '../base/base_response.dart';
import '../../../constants.dart';

part 'error_info.g.dart';

/// {@template error_info}
/// Ошибка платежа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ErrorInfo extends BaseResponse {
  /// {@macro error_info}
  ErrorInfo({
    this.code,
    this.description,
    this.message,
  });

  /// {@macro fromJson}
  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorInfoToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.code: code,
        JsonKeys.description: description,
        JsonKeys.message: message,
      };

  /// Код ошибки
  @JsonKey(name: JsonKeys.code)
  final String? code;

  /// Подробное техническое объяснение ошибки - содержимое этого параметра не предназначено для отображения пользователю.
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Понятное описание ошибки - предназначено для отображения пользователю
  @JsonKey(name: JsonKeys.message)
  final String? message;
}

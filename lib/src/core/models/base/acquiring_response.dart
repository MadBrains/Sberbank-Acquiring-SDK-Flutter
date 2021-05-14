import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import 'base_response.dart';

part 'acquiring_response.g.dart';

/// {@template acquiring_response}
/// Базовый класс ответа Base API
/// {@endtemplate}
@JsonSerializable()
class AcquiringResponse extends BaseResponse {
  /// {@macro acquiring_response}
  AcquiringResponse({
    this.errorCode,
    this.errorMessage,
  });

  /// {@macro fromJson}
  factory AcquiringResponse.fromJson(Map<String, dynamic> json) =>
      _$AcquiringResponseFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.errorCode: errorCode,
        JsonKeys.errorMessage: errorMessage,
      };

  @override
  Map<String, dynamic> toJson() => _$AcquiringResponseToJson(this);

  /// Проверка наличии ошибки
  bool get hasError => errorCode != null && errorCode != '0';

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  /// Краткое описание ошибки
  @JsonKey(name: JsonKeys.errorMessage)
  final String? errorMessage;
}

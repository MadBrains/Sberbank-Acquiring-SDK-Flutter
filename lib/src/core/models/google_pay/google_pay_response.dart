import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../common/error_info.dart';
import '../common/data.dart';
import '../base/acquiring_response.dart';

part 'google_pay_response.g.dart';

/// {@template google_pay_response}
/// Ответ на оплату с помощью Google Pay
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GooglePayResponse extends AcquiringResponse {
  /// {@macro google_pay_response}
  GooglePayResponse({
    String errorCode,
    String errorMessage,
    this.success,
    this.data,
    this.error,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory GooglePayResponse.fromJson(Map<String, dynamic> json) =>
      _$GooglePayResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GooglePayResponseToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.success: success,
        JsonKeys.data: data,
        JsonKeys.error: error,
      };

  /// Указывает на успешность запроса. Доступны следующие значения:
  /// - `true` (истина) - запрос обработан успешно;
  /// - `false` (ложь) - запрос не прошёл.
  @JsonKey(name: JsonKeys.success)
  final bool success;

  /// Номер заказа в платёжной системе.
  /// Уникален в пределах системы.
  /// Отсутствует, если регистрация заказа на удалась по причине ошибки.
  @JsonKey(name: JsonKeys.data)
  final Data data;

  /// {@macro error_info}
  @JsonKey(name: JsonKeys.error)
  final ErrorInfo error;
}

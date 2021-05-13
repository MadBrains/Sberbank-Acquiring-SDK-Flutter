import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../common/data.dart';
import '../common/error_info.dart';
import '../common/order_status_info.dart';

part 'apple_pay_recurrent_response.g.dart';

/// {@template apple_pay_recurrent_response}
/// Ответ на проведение рекуррентных платежей Apple Pay
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ApplePayRecurrentResponse extends AcquiringResponse {
  /// {@macro apple_pay_recurrent_response}
  ApplePayRecurrentResponse({
    String errorCode,
    String errorMessage,
    this.success,
    this.data,
    this.error,
    this.orderStatus,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory ApplePayRecurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplePayRecurrentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApplePayRecurrentResponseToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.success: success,
        JsonKeys.data: data,
        JsonKeys.error: error,
        JsonKeys.orderStatus: orderStatus,
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

  /// {@macro order_status}
  @JsonKey(name: JsonKeys.orderStatus)
  final OrderStatusInfo orderStatus;
}

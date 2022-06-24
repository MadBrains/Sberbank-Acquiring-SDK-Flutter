import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';
import '../enums/payment_state.dart';

part 'payment_amount_info.g.dart';

/// {@template payment_amount_info}
/// Информация о сумме платежа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class PaymentAmountInfo extends BaseResponse {
  /// {@macro payment_amount_info}
  PaymentAmountInfo({
    this.approvedAmount,
    this.depositedAmount,
    this.refundedAmount,
    this.paymentState,
    this.feeAmount,
    this.totalAmount,
  });

  /// {@macro fromJson}
  factory PaymentAmountInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentAmountInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentAmountInfoToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.approvedAmount: approvedAmount,
        JsonKeys.depositedAmount: depositedAmount,
        JsonKeys.refundedAmount: refundedAmount,
        JsonKeys.paymentState: paymentState,
        JsonKeys.feeAmount: feeAmount,
        JsonKeys.totalAmount: totalAmount,
      };

  /// Сумма, подтверждённая к списанию
  @JsonKey(name: JsonKeys.approvedAmount)
  final int? approvedAmount;

  /// Сумма в минимальных единицах валюты (например, в копейках), подтверждённая для списания с карты
  @JsonKey(name: JsonKeys.depositedAmount)
  final int? depositedAmount;

  /// Сумма возврата в минимальных единицах валюты
  @JsonKey(name: JsonKeys.refundedAmount)
  final int? refundedAmount;

  /// {@macro payment_state}
  @JsonKey(name: JsonKeys.paymentState)
  final PaymentState? paymentState;

  /// Сумма комиссии в минимальных единицах валюты
  @JsonKey(name: JsonKeys.feeAmount)
  final int? feeAmount;

  /// Сумма заказа + fee (комиссия, если она была использована в заказе).
  @JsonKey(name: JsonKeys.totalAmount)
  final int? totalAmount;
}

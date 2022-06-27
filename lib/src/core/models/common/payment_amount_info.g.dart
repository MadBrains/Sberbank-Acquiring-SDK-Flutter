// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_amount_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAmountInfo _$PaymentAmountInfoFromJson(Map<String, dynamic> json) =>
    PaymentAmountInfo(
      approvedAmount: json['approvedAmount'] as int?,
      depositedAmount: json['depositedAmount'] as int?,
      refundedAmount: json['refundedAmount'] as int?,
      paymentState:
          $enumDecodeNullable(_$PaymentStateEnumMap, json['paymentState']),
      feeAmount: json['feeAmount'] as int?,
      totalAmount: json['totalAmount'] as int?,
    );

Map<String, dynamic> _$PaymentAmountInfoToJson(PaymentAmountInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('approvedAmount', instance.approvedAmount);
  writeNotNull('depositedAmount', instance.depositedAmount);
  writeNotNull('refundedAmount', instance.refundedAmount);
  writeNotNull('paymentState', _$PaymentStateEnumMap[instance.paymentState]);
  writeNotNull('feeAmount', instance.feeAmount);
  writeNotNull('totalAmount', instance.totalAmount);
  return val;
}

const _$PaymentStateEnumMap = {
  PaymentState.created: 'CREATED',
  PaymentState.approved: 'APPROVED',
  PaymentState.deposited: 'DEPOSITED',
  PaymentState.declined: 'DECLINED',
  PaymentState.reversed: 'REVERSED',
  PaymentState.refunded: 'REFUNDED',
};

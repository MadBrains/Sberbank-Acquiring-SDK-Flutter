// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_amount_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAmountInfo _$PaymentAmountInfoFromJson(Map<String, dynamic> json) {
  return PaymentAmountInfo(
    approvedAmount: json['approvedAmount'] as int,
    depositedAmount: json['depositedAmount'] as int,
    refundedAmount: json['refundedAmount'] as int,
    paymentState:
        _$enumDecodeNullable(_$PaymentStateEnumMap, json['paymentState']),
    feeAmount: json['feeAmount'] as int,
  );
}

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
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PaymentStateEnumMap = {
  PaymentState.created: 'CREATED',
  PaymentState.approved: 'APPROVED',
  PaymentState.deposited: 'DEPOSITED',
  PaymentState.declined: 'DECLINED',
  PaymentState.reversed: 'REVERSED',
  PaymentState.refunded: 'REFUNDED',
};

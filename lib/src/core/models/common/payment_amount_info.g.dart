// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_amount_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAmountInfo _$PaymentAmountInfoFromJson(Map<String, dynamic> json) {
  return PaymentAmountInfo(
    approvedAmount: json['approvedAmount'] as int?,
    depositedAmount: json['depositedAmount'] as int?,
    refundedAmount: json['refundedAmount'] as int?,
    paymentState:
        _$enumDecodeNullable(_$PaymentStateEnumMap, json['paymentState']),
    feeAmount: json['feeAmount'] as int?,
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

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PaymentStateEnumMap = {
  PaymentState.created: 'CREATED',
  PaymentState.approved: 'APPROVED',
  PaymentState.deposited: 'DEPOSITED',
  PaymentState.declined: 'DECLINED',
  PaymentState.reversed: 'REVERSED',
  PaymentState.refunded: 'REFUNDED',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusInfo _$OrderStatusInfoFromJson(Map<String, dynamic> json) {
  return OrderStatusInfo(
    errorCode: json['errorCode'] as int,
    orderNumber: json['orderNumber'] as String,
    orderStatus:
        _$enumDecodeNullable(_$OrderStatusEnumMap, json['orderStatus']),
    actionCode: json['actionCode'] as int,
    actionCodeDescription: json['actionCodeDescription'] as String,
    amount: json['amount'] as int,
    currency: json['currency'] as int,
    date: json['date'] as String,
    merchantOrderParams: (json['merchantOrderParams'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cardAuthInfo: json['cardAuthInfo'] == null
        ? null
        : CardAuthInfo.fromJson(json['cardAuthInfo'] as Map<String, dynamic>),
    terminalId: json['terminalId'] as String,
    authDateTime: json['authDateTime'] as String,
    authRefNum: json['authRefNum'] as String,
    paymentAmountInfo: json['paymentAmountInfo'] == null
        ? null
        : PaymentAmountInfo.fromJson(
            json['paymentAmountInfo'] as Map<String, dynamic>),
    bankInfo: json['bankInfo'] == null
        ? null
        : BankInfo.fromJson(json['bankInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderStatusInfoToJson(OrderStatusInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('orderStatus', _$OrderStatusEnumMap[instance.orderStatus]);
  writeNotNull('actionCode', instance.actionCode);
  writeNotNull('actionCodeDescription', instance.actionCodeDescription);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('date', instance.date);
  writeNotNull('merchantOrderParams', instance.merchantOrderParams);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('cardAuthInfo', instance.cardAuthInfo);
  writeNotNull('terminalId', instance.terminalId);
  writeNotNull('authDateTime', instance.authDateTime);
  writeNotNull('authRefNum', instance.authRefNum);
  writeNotNull('paymentAmountInfo', instance.paymentAmountInfo);
  writeNotNull('bankInfo', instance.bankInfo);
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

const _$OrderStatusEnumMap = {
  OrderStatus.registeredNotPaid: 0,
  OrderStatus.preAuthorized: 1,
  OrderStatus.fullAuthorization: 2,
  OrderStatus.authorizationCanceled: 3,
  OrderStatus.refaundTransactions: 4,
  OrderStatus.authorizationThroughIssuingBank: 5,
  OrderStatus.authorizationDenied: 6,
};

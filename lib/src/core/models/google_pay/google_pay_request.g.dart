// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePayRequest _$GooglePayRequestFromJson(Map<String, dynamic> json) =>
    GooglePayRequest(
      merchant: json['merchant'] as String,
      orderNumber: json['orderNumber'] as String,
      paymentToken: json['paymentToken'] as String,
      amount: json['amount'] as int,
      returnUrl: json['returnUrl'] as String,
      protocolVersion: $enumDecodeNullable(
          _$ProtocolVersionEnumMap, json['protocolVersion']),
      description: json['description'] as String?,
      language: json['language'] as String?,
      feeInput: json['feeInput'] as int?,
      additionalParameters:
          json['additionalParameters'] as Map<String, dynamic>?,
      preAuth: json['preAuth'] as bool?,
      clientId: json['clientId'] as String?,
      ip: json['ip'] as String?,
      currencyCode: json['currencyCode'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as int?,
      failUrl: json['failUrl'] as String?,
      dynamicCallbackUrl: json['dynamicCallbackUrl'] as String?,
      billingPayerData: json['billingPayerData'] == null
          ? null
          : BillingPayerData.fromJson(
              json['billingPayerData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GooglePayRequestToJson(GooglePayRequest instance) {
  final val = <String, dynamic>{
    'merchant': instance.merchant,
    'orderNumber': instance.orderNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('language', instance.language);
  writeNotNull('additionalParameters', instance.additionalParameters);
  writeNotNull('preAuth', instance.preAuth);
  writeNotNull('clientId', instance.clientId);
  val['paymentToken'] = instance.paymentToken;
  writeNotNull('ip', instance.ip);
  val['amount'] = instance.amount;
  writeNotNull('currencyCode', instance.currencyCode);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  val['returnUrl'] = instance.returnUrl;
  writeNotNull('failUrl', instance.failUrl);
  writeNotNull(
      'protocolVersion', _$ProtocolVersionEnumMap[instance.protocolVersion]);
  writeNotNull('feeInput', instance.feeInput);
  writeNotNull('dynamicCallbackUrl', instance.dynamicCallbackUrl);
  writeNotNull('billingPayerData', instance.billingPayerData);
  return val;
}

const _$ProtocolVersionEnumMap = {
  ProtocolVersion.ecv1: 'ECv1',
  ProtocolVersion.ecv2: 'ECv2',
};

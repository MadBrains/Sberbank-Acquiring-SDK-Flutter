// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePayRequest _$GooglePayRequestFromJson(Map<String, dynamic> json) {
  return GooglePayRequest(
    merchant: json['merchant'] as String,
    orderNumber: json['orderNumber'] as String,
    description: json['description'] as String,
    language: json['language'] as String,
    additionalParameters: json['additionalParameters'] as Map<String, dynamic>,
    preAuth: json['preAuth'] as bool,
    clientId: json['clientId'] as String,
    paymentToken: json['paymentToken'] as String,
    ip: json['ip'] as String,
    amount: json['amount'] as int,
    currencyCode: json['currencyCode'] as String,
    email: json['email'] as String,
    phone: json['phone'] as int,
    returnUrl: json['returnUrl'] as String,
    failUrl: json['failUrl'] as String,
  );
}

Map<String, dynamic> _$GooglePayRequestToJson(GooglePayRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('merchant', instance.merchant);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('description', instance.description);
  writeNotNull('language', instance.language);
  writeNotNull('additionalParameters', instance.additionalParameters);
  writeNotNull('preAuth', instance.preAuth);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('paymentToken', instance.paymentToken);
  writeNotNull('ip', instance.ip);
  writeNotNull('amount', instance.amount);
  writeNotNull('currencyCode', instance.currencyCode);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('returnUrl', instance.returnUrl);
  writeNotNull('failUrl', instance.failUrl);
  return val;
}

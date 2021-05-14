// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplePayRequest _$ApplePayRequestFromJson(Map<String, dynamic> json) {
  return ApplePayRequest(
    merchant: json['merchant'] as String,
    paymentToken: json['paymentToken'] as String,
    orderNumber: json['orderNumber'] as String?,
    description: json['description'] as String?,
    language: json['language'] as String?,
    additionalParameters: json['additionalParameters'] as Map<String, dynamic>?,
    preAuth: json['preAuth'] as bool?,
  );
}

Map<String, dynamic> _$ApplePayRequestToJson(ApplePayRequest instance) {
  final val = <String, dynamic>{
    'merchant': instance.merchant,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('description', instance.description);
  writeNotNull('language', instance.language);
  writeNotNull('additionalParameters', instance.additionalParameters);
  writeNotNull('preAuth', instance.preAuth);
  val['paymentToken'] = instance.paymentToken;
  return val;
}

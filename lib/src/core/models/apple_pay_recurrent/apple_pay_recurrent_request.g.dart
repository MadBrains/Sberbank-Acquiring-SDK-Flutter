// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_pay_recurrent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplePayRecurrentRequest _$ApplePayRecurrentRequestFromJson(
    Map<String, dynamic> json) {
  return ApplePayRecurrentRequest(
    orderNumber: json['orderNumber'] as String,
    language: json['language'] as String,
    bindingId: json['bindingId'] as String,
    amount: json['amount'] as int,
    currency: json['currency'] as int,
    description: json['description'] as String,
    additionalParameters: json['additionalParameters'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ApplePayRecurrentRequestToJson(
    ApplePayRecurrentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('language', instance.language);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('description', instance.description);
  writeNotNull('additionalParameters', instance.additionalParameters);
  return val;
}

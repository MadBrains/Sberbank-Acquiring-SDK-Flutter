// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decline_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeclineRequest _$DeclineRequestFromJson(Map<String, dynamic> json) =>
    DeclineRequest(
      merchantLogin: json['merchantLogin'] as String,
      language: json['language'] as String?,
      orderId: json['orderId'] as String?,
      orderNumber: json['orderNumber'] as String?,
    );

Map<String, dynamic> _$DeclineRequestToJson(DeclineRequest instance) {
  final val = <String, dynamic>{
    'merchantLogin': instance.merchantLogin,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('orderNumber', instance.orderNumber);
  return val;
}

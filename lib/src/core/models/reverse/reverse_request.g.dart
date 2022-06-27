// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseRequest _$ReverseRequestFromJson(Map<String, dynamic> json) =>
    ReverseRequest(
      orderId: json['orderId'] as String,
      amount: json['amount'] as int?,
      jsonParams: json['jsonParams'] as Map<String, dynamic>?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$ReverseRequestToJson(ReverseRequest instance) {
  final val = <String, dynamic>{
    'orderId': instance.orderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('jsonParams', instance.jsonParams);
  writeNotNull('language', instance.language);
  return val;
}

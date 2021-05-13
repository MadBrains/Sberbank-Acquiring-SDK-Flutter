// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseRequest _$ReverseRequestFromJson(Map<String, dynamic> json) {
  return ReverseRequest(
    orderId: json['orderId'] as String,
    jsonParams: json['jsonParams'] as Map<String, dynamic>,
    language: json['language'] as String,
  );
}

Map<String, dynamic> _$ReverseRequestToJson(ReverseRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderId', instance.orderId);
  writeNotNull('jsonParams', instance.jsonParams);
  writeNotNull('language', instance.language);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_binding_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendBindingRequest _$ExtendBindingRequestFromJson(
        Map<String, dynamic> json) =>
    ExtendBindingRequest(
      bindingId: json['bindingId'] as String,
      newExpiry: json['newExpiry'] as int,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$ExtendBindingRequestToJson(
    ExtendBindingRequest instance) {
  final val = <String, dynamic>{
    'bindingId': instance.bindingId,
    'newExpiry': instance.newExpiry,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  return val;
}

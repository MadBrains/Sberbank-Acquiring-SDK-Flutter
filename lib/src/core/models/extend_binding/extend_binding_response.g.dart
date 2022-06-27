// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_binding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendBindingResponse _$ExtendBindingResponseFromJson(
        Map<String, dynamic> json) =>
    ExtendBindingResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ExtendBindingResponseToJson(
    ExtendBindingResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  return val;
}

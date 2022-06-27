// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseResponse _$ReverseResponseFromJson(Map<String, dynamic> json) =>
    ReverseResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ReverseResponseToJson(ReverseResponse instance) {
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

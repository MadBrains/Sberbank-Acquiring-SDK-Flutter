// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acquiring_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcquiringResponse _$AcquiringResponseFromJson(Map<String, dynamic> json) {
  return AcquiringResponse(
    errorCode: json['errorCode'] as String?,
    errorMessage: json['errorMessage'] as String?,
  );
}

Map<String, dynamic> _$AcquiringResponseToJson(AcquiringResponse instance) {
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

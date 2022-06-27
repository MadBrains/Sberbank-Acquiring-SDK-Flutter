// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_enrollment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEnrollmentResponse _$VerifyEnrollmentResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyEnrollmentResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      isEnrolled: $enumDecodeNullable(_$EnrolledEnumMap, json['isEnrolled']),
      emitterName: json['emitterName'] as String?,
      emitterCountryCode: json['emitterCountryCode'] as int?,
    );

Map<String, dynamic> _$VerifyEnrollmentResponseToJson(
    VerifyEnrollmentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('isEnrolled', _$EnrolledEnumMap[instance.isEnrolled]);
  writeNotNull('emitterName', instance.emitterName);
  writeNotNull('emitterCountryCode', instance.emitterCountryCode);
  return val;
}

const _$EnrolledEnumMap = {
  Enrolled.yes: 'Y',
  Enrolled.no: 'N',
  Enrolled.unknown: 'U',
};

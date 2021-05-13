// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_enrollment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEnrollmentRequest _$VerifyEnrollmentRequestFromJson(
    Map<String, dynamic> json) {
  return VerifyEnrollmentRequest(
    pan: json['pan'] as String,
  );
}

Map<String, dynamic> _$VerifyEnrollmentRequestToJson(
    VerifyEnrollmentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pan', instance.pan);
  return val;
}

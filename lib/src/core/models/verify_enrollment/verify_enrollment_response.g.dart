// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_enrollment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEnrollmentResponse _$VerifyEnrollmentResponseFromJson(
    Map<String, dynamic> json) {
  return VerifyEnrollmentResponse(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    enrolled: _$enumDecodeNullable(_$EnrolledEnumMap, json['enrolled']),
    emitterName: json['emitterName'] as String,
    emitterCountryCode: json['emitterCountryCode'] as int,
  );
}

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
  writeNotNull('enrolled', _$EnrolledEnumMap[instance.enrolled]);
  writeNotNull('emitterName', instance.emitterName);
  writeNotNull('emitterCountryCode', instance.emitterCountryCode);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$EnrolledEnumMap = {
  Enrolled.yes: 'Y',
  Enrolled.no: 'N',
  Enrolled.unknown: 'U',
};

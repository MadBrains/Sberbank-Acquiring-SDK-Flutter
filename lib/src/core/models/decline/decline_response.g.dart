// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeclineResponse _$DeclineResponseFromJson(Map<String, dynamic> json) =>
    DeclineResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      userMessage: json['userMessage'] as String?,
    );

Map<String, dynamic> _$DeclineResponseToJson(DeclineResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('userMessage', instance.userMessage);
  return val;
}

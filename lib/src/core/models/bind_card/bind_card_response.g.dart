// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bind_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BindCardResponse _$BindCardResponseFromJson(Map<String, dynamic> json) =>
    BindCardResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$BindCardResponseToJson(BindCardResponse instance) {
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

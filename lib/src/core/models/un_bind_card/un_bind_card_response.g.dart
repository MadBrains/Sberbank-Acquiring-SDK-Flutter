// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'un_bind_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnBindCardResponse _$UnBindCardResponseFromJson(Map<String, dynamic> json) =>
    UnBindCardResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$UnBindCardResponseToJson(UnBindCardResponse instance) {
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

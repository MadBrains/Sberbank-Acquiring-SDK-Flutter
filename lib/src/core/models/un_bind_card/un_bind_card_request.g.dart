// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'un_bind_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnBindCardRequest _$UnBindCardRequestFromJson(Map<String, dynamic> json) {
  return UnBindCardRequest(
    bindingId: json['bindingId'] as String,
  );
}

Map<String, dynamic> _$UnBindCardRequestToJson(UnBindCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindingId', instance.bindingId);
  return val;
}

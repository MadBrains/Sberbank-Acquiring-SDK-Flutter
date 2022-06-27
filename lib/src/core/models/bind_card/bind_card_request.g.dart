// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bind_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BindCardRequest _$BindCardRequestFromJson(Map<String, dynamic> json) =>
    BindCardRequest(
      bindingId: json['bindingId'] as String?,
    );

Map<String, dynamic> _$BindCardRequestToJson(BindCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindingId', instance.bindingId);
  return val;
}

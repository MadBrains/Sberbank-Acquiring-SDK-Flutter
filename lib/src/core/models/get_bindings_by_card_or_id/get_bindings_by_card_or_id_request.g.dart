// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bindings_by_card_or_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBindingsByCardOrIdRequest _$GetBindingsByCardOrIdRequestFromJson(
        Map<String, dynamic> json) =>
    GetBindingsByCardOrIdRequest(
      pan: json['pan'] as String?,
      bindingId: json['bindingId'] as String?,
      showExpired: json['showExpired'] as bool?,
    );

Map<String, dynamic> _$GetBindingsByCardOrIdRequestToJson(
    GetBindingsByCardOrIdRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pan', instance.pan);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('showExpired', instance.showExpired);
  return val;
}

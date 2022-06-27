// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BindingInfo _$BindingInfoFromJson(Map<String, dynamic> json) => BindingInfo(
      clientId: json['clientId'] as String?,
      bindingId: json['bindingId'] as String?,
      authDateTime: json['authDateTime'] as String?,
      terminalId: json['terminalId'] as String?,
    );

Map<String, dynamic> _$BindingInfoToJson(BindingInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('authDateTime', instance.authDateTime);
  writeNotNull('terminalId', instance.terminalId);
  return val;
}

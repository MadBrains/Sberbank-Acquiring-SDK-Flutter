// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bindings_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBindingsRequest _$GetBindingsRequestFromJson(Map<String, dynamic> json) =>
    GetBindingsRequest(
      clientId: json['clientId'] as String,
      bindingType: $enumDecode(_$BindingTypeEnumMap, json['bindingType']),
      bindingId: json['bindingId'] as String?,
      showExpired: json['showExpired'] as bool?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GetBindingsRequestToJson(GetBindingsRequest instance) {
  final val = <String, dynamic>{
    'clientId': instance.clientId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('showExpired', instance.showExpired);
  val['bindingType'] = _$BindingTypeEnumMap[instance.bindingType];
  writeNotNull('language', instance.language);
  return val;
}

const _$BindingTypeEnumMap = {
  BindingType.c: 'С',
  BindingType.i: 'I',
  BindingType.r: 'R',
  BindingType.rc: 'RC',
};

GetAllBindingsRequest _$GetAllBindingsRequestFromJson(
        Map<String, dynamic> json) =>
    GetAllBindingsRequest(
      clientId: json['clientId'] as String,
      bindingType: $enumDecode(_$BindingTypeEnumMap, json['bindingType']),
      bindingId: json['bindingId'] as String?,
      showExpired: json['showExpired'] as bool?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GetAllBindingsRequestToJson(
    GetAllBindingsRequest instance) {
  final val = <String, dynamic>{
    'clientId': instance.clientId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('showExpired', instance.showExpired);
  val['bindingType'] = _$BindingTypeEnumMap[instance.bindingType];
  writeNotNull('language', instance.language);
  return val;
}

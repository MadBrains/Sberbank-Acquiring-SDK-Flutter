// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bindings_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBindingsRequest _$GetBindingsRequestFromJson(Map<String, dynamic> json) {
  return GetBindingsRequest(
    clientId: json['clientId'] as String,
  );
}

Map<String, dynamic> _$GetBindingsRequestToJson(GetBindingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  return val;
}

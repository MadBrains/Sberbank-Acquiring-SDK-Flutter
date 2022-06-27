// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bindings_by_card_or_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBindingsByCardOrIdResponse _$GetBindingsByCardOrIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetBindingsByCardOrIdResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      bindings: (json['bindings'] as List<dynamic>?)
          ?.map((e) => Binding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBindingsByCardOrIdResponseToJson(
    GetBindingsByCardOrIdResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('bindings', instance.bindings);
  return val;
}

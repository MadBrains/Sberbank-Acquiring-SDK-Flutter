// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Binding _$BindingFromJson(Map<String, dynamic> json) {
  return Binding(
    bindingId: json['bindingId'] as String,
    maskedPan: json['maskedPan'] as String,
    expiryDate: json['expiryDate'] as int,
    clientId: json['clientId'] as String,
  );
}

Map<String, dynamic> _$BindingToJson(Binding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('maskedPan', instance.maskedPan);
  writeNotNull('expiryDate', instance.expiryDate);
  writeNotNull('clientId', instance.clientId);
  return val;
}

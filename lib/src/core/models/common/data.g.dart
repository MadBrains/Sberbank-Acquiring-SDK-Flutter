// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      orderId: json['orderId'] as String?,
      bindingId: json['bindingId'] as String?,
      acsUrl: json['acsUrl'] as String?,
      paReq: json['paReq'] as String?,
      termUrl: json['termUrl'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderId', instance.orderId);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('acsUrl', instance.acsUrl);
  writeNotNull('paReq', instance.paReq);
  writeNotNull('termUrl', instance.termUrl);
  return val;
}

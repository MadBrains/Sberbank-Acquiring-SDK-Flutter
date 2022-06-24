// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_receipt_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReceiptStatusRequest _$GetReceiptStatusRequestFromJson(
        Map<String, dynamic> json) =>
    GetReceiptStatusRequest(
      orderId: json['orderId'] as String?,
      orderNumber: json['orderNumber'] as String?,
      uuid: json['uuid'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GetReceiptStatusRequestToJson(
    GetReceiptStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderId', instance.orderId);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('language', instance.language);
  return val;
}

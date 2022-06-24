// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_status_extended_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderStatusExtendedRequest _$GetOrderStatusExtendedRequestFromJson(
        Map<String, dynamic> json) =>
    GetOrderStatusExtendedRequest(
      orderId: json['orderId'] as String?,
      orderNumber: json['orderNumber'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GetOrderStatusExtendedRequestToJson(
    GetOrderStatusExtendedRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderId', instance.orderId);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('language', instance.language);
  return val;
}

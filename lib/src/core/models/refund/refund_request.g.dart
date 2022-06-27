// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundRequest _$RefundRequestFromJson(Map<String, dynamic> json) =>
    RefundRequest(
      amount: json['amount'] as int,
      orderId: json['orderId'] as String,
      jsonParams: json['jsonParams'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RefundRequestToJson(RefundRequest instance) {
  final val = <String, dynamic>{
    'amount': instance.amount,
    'orderId': instance.orderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jsonParams', instance.jsonParams);
  return val;
}

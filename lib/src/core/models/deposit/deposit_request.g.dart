// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositRequest _$DepositRequestFromJson(Map<String, dynamic> json) {
  return DepositRequest(
    amount: json['amount'] as int,
    orderId: json['orderId'] as String,
  );
}

Map<String, dynamic> _$DepositRequestToJson(DepositRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('orderId', instance.orderId);
  return val;
}

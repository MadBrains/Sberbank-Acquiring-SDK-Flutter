// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refunds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refunds _$RefundsFromJson(Map<String, dynamic> json) => Refunds(
      referenceNumber: json['referenceNumber'] as int?,
      actionCode: json['actionCode'] as int?,
      amount: json['amount'] as int?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$RefundsToJson(Refunds instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('referenceNumber', instance.referenceNumber);
  writeNotNull('actionCode', instance.actionCode);
  writeNotNull('amount', instance.amount);
  writeNotNull('date', instance.date);
  return val;
}

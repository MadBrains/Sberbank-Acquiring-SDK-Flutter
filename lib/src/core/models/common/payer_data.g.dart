// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayerData _$PayerDataFromJson(Map<String, dynamic> json) => PayerData(
      email: json['email'] as String?,
      transactionAttributes: (json['transactionAttributes'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PayerDataToJson(PayerData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('transactionAttributes', instance.transactionAttributes);
  return val;
}

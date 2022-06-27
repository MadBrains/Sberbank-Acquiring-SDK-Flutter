// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_payer_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingPayerData _$BillingPayerDataFromJson(Map<String, dynamic> json) =>
    BillingPayerData(
      billingCity: json['billingCity'] as String?,
      billingCountry: json['billingCountry'] as String?,
      billingAddressLine1: json['billingAddressLine1'] as String?,
      billingAddressLine2: json['billingAddressLine2'] as String?,
      billingAddressLine3: json['billingAddressLine3'] as String?,
      billingPostalCode: json['billingPostalCode'] as String?,
      billingState: json['billingState'] as String?,
    );

Map<String, dynamic> _$BillingPayerDataToJson(BillingPayerData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingCity', instance.billingCity);
  writeNotNull('billingCountry', instance.billingCountry);
  writeNotNull('billingAddressLine1', instance.billingAddressLine1);
  writeNotNull('billingAddressLine2', instance.billingAddressLine2);
  writeNotNull('billingAddressLine3', instance.billingAddressLine3);
  writeNotNull('billingPostalCode', instance.billingPostalCode);
  writeNotNull('billingState', instance.billingState);
  return val;
}

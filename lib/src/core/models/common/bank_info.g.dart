// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfo _$BankInfoFromJson(Map<String, dynamic> json) => BankInfo(
      bankName: json['bankName'] as String?,
      bankCountryCode: json['bankCountryCode'] as String?,
      bankCountryName: json['bankCountryName'] as String?,
    );

Map<String, dynamic> _$BankInfoToJson(BankInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bankName', instance.bankName);
  writeNotNull('bankCountryCode', instance.bankCountryCode);
  writeNotNull('bankCountryName', instance.bankCountryName);
  return val;
}

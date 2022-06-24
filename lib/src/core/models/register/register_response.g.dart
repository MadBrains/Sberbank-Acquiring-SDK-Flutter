// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      orderId: json['orderId'] as String?,
      formUrl: json['formUrl'] as String?,
      externalParams: json['externalParams'] == null
          ? null
          : RegisterExternalParams.fromJson(
              json['externalParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('formUrl', instance.formUrl);
  writeNotNull('externalParams', instance.externalParams);
  return val;
}

RegisterExternalParams _$RegisterExternalParamsFromJson(
        Map<String, dynamic> json) =>
    RegisterExternalParams(
      sbolDeepLink: json['sbolDeepLink'] as String?,
      sbolBankInvoiceId: json['sbolBankInvoiceId'] as String?,
      sbolInactive: json['sbolInactive'] as bool?,
    );

Map<String, dynamic> _$RegisterExternalParamsToJson(
    RegisterExternalParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sbolDeepLink', instance.sbolDeepLink);
  writeNotNull('sbolBankInvoiceId', instance.sbolBankInvoiceId);
  writeNotNull('sbolInactive', instance.sbolInactive);
  return val;
}

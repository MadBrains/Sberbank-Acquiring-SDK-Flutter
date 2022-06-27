// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_binding_no_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBindingNoPaymentResponse _$CreateBindingNoPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    CreateBindingNoPaymentResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      bindingId: json['bindingId'] as String?,
      clientId: json['clientId'] as String?,
      cardholderName: json['cardholderName'] as String?,
      expiryDate: json['expiryDate'] as int?,
      maskedPan: json['maskedPan'] as String?,
    );

Map<String, dynamic> _$CreateBindingNoPaymentResponseToJson(
    CreateBindingNoPaymentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('cardholderName', instance.cardholderName);
  writeNotNull('expiryDate', instance.expiryDate);
  writeNotNull('maskedPan', instance.maskedPan);
  return val;
}

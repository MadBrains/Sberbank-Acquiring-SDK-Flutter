// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_binding_no_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBindingNoPaymentRequest _$CreateBindingNoPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    CreateBindingNoPaymentRequest(
      clientId: json['clientId'] as String,
      cardholderName: json['cardholderName'] as String,
      expiryDate: json['expiryDate'] as int,
      pan: json['pan'] as String,
      additionalParameters:
          json['additionalParameters'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateBindingNoPaymentRequestToJson(
    CreateBindingNoPaymentRequest instance) {
  final val = <String, dynamic>{
    'clientId': instance.clientId,
    'cardholderName': instance.cardholderName,
    'expiryDate': instance.expiryDate,
    'pan': instance.pan,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalParameters', instance.additionalParameters);
  return val;
}

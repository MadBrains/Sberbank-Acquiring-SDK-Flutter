// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Binding _$BindingFromJson(Map<String, dynamic> json) => Binding(
      bindingId: json['bindingId'] as String?,
      maskedPan: json['maskedPan'] as String?,
      expiryDate: json['expiryDate'] as int?,
      clientId: json['clientId'] as String?,
      paymentWay: $enumDecodeNullable(_$PaymentWayEnumMap, json['paymentWay']),
      paymentSystem:
          $enumDecodeNullable(_$PaymentSystemEnumMap, json['paymentSystem']),
      bindingCategory:
          $enumDecodeNullable(_$BindingTypeEnumMap, json['bindingCategory']),
      displayLabel: json['displayLabel'] as int?,
    );

Map<String, dynamic> _$BindingToJson(Binding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('maskedPan', instance.maskedPan);
  writeNotNull('expiryDate', instance.expiryDate);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('paymentWay', _$PaymentWayEnumMap[instance.paymentWay]);
  writeNotNull('paymentSystem', _$PaymentSystemEnumMap[instance.paymentSystem]);
  writeNotNull(
      'bindingCategory', _$BindingTypeEnumMap[instance.bindingCategory]);
  writeNotNull('displayLabel', instance.displayLabel);
  return val;
}

const _$PaymentWayEnumMap = {
  PaymentWay.card: 'CARD',
  PaymentWay.cardBinding: 'CARD_BINDING',
  PaymentWay.cardMoto: 'CARD_MOTO',
  PaymentWay.cardPresent: 'CARD_PRESENT',
  PaymentWay.sberSbol: 'SBRF_SBOL',
  PaymentWay.upop: 'UPOP',
  PaymentWay.fileBinding: 'FILE_BINDING',
  PaymentWay.smsBinding: 'SMS_BINDING',
  PaymentWay.p2p: 'P2P',
  PaymentWay.p2pBinding: 'P2P_BINDING',
  PaymentWay.paypal: 'PAYPAL',
  PaymentWay.mts: 'MTS',
  PaymentWay.applePay: 'APPLE_PAY',
  PaymentWay.applePayBinding: 'APPLE_PAY_BINDING',
  PaymentWay.androidPay: 'ANDROID_PAY',
  PaymentWay.androidPayBinding: 'ANDROID_PAY_BINDING',
  PaymentWay.googlePayCard: 'GOOGLE_PAY_CARD',
  PaymentWay.googlePayCardBinding: 'GOOGLE_PAY_CARD_BINDING',
  PaymentWay.googlePayTokenized: 'GOOGLE_PAY_TOKENIZED',
  PaymentWay.googlePayTokenizedBinding: 'GOOGLE_PAY_TOKENIZED_BINDING',
  PaymentWay.samsungPay: 'SAMSUNG_PAY',
  PaymentWay.samsungPayBinding: 'SAMSUNG_PAY_BINDING',
  PaymentWay.iPOS: 'IPOS',
  PaymentWay.sberPay: 'SBERPAY',
  PaymentWay.sberId: 'SBERID',
};

const _$PaymentSystemEnumMap = {
  PaymentSystem.visa: 'VISA',
  PaymentSystem.mastercard: 'MASTERCARD',
  PaymentSystem.amex: 'AMEX',
  PaymentSystem.jcb: 'JCB',
  PaymentSystem.cup: 'CUP',
  PaymentSystem.mir: 'MIR',
};

const _$BindingTypeEnumMap = {
  BindingType.c: 'С',
  BindingType.i: 'I',
  BindingType.r: 'R',
  BindingType.rc: 'RC',
};

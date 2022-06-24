// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_status_extended_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderStatusExtendedResponse _$GetOrderStatusExtendedResponseFromJson(
        Map<String, dynamic> json) =>
    GetOrderStatusExtendedResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      orderNumber: json['orderNumber'] as String?,
      orderStatus:
          $enumDecodeNullable(_$OrderStatusEnumMap, json['orderStatus']),
      actionCode: json['actionCode'] as int?,
      actionCodeDescription: json['actionCodeDescription'] as String?,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      date: json['date'] as int?,
      depositedDate: json['depositedDate'] as int?,
      orderDescription: json['orderDescription'] as String?,
      ip: json['ip'] as String?,
      authRefNum: json['authRefNum'] as String?,
      refundedDate: json['refundedDate'] as String?,
      paymentWay: $enumDecodeNullable(_$PaymentWayEnumMap, json['paymentWay']),
      avsCode: $enumDecodeNullable(_$AvsCodeEnumMap, json['avsCode']),
      merchantOrderParams: (json['merchantOrderParams'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactionAttributes: (json['transactionAttributes'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      cardAuthInfo: json['cardAuthInfo'] == null
          ? null
          : CardAuthInfo.fromJson(json['cardAuthInfo'] as Map<String, dynamic>),
      terminalId: json['terminalId'] as String?,
      paymentAmountInfo: json['paymentAmountInfo'] == null
          ? null
          : PaymentAmountInfo.fromJson(
              json['paymentAmountInfo'] as Map<String, dynamic>),
      bankInfo: json['bankInfo'] == null
          ? null
          : BankInfo.fromJson(json['bankInfo'] as Map<String, dynamic>),
      bindingInfo: json['bindingInfo'] == null
          ? null
          : BindingInfo.fromJson(json['bindingInfo'] as Map<String, dynamic>),
      payerData: json['payerData'] == null
          ? null
          : PayerData.fromJson(json['payerData'] as Map<String, dynamic>),
      refunds: json['refunds'] == null
          ? null
          : Refunds.fromJson(json['refunds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrderStatusExtendedResponseToJson(
    GetOrderStatusExtendedResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('orderStatus', _$OrderStatusEnumMap[instance.orderStatus]);
  writeNotNull('actionCode', instance.actionCode);
  writeNotNull('actionCodeDescription', instance.actionCodeDescription);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('date', instance.date);
  writeNotNull('depositedDate', instance.depositedDate);
  writeNotNull('orderDescription', instance.orderDescription);
  writeNotNull('ip', instance.ip);
  writeNotNull('authRefNum', instance.authRefNum);
  writeNotNull('refundedDate', instance.refundedDate);
  writeNotNull('paymentWay', _$PaymentWayEnumMap[instance.paymentWay]);
  writeNotNull('avsCode', _$AvsCodeEnumMap[instance.avsCode]);
  writeNotNull('merchantOrderParams', instance.merchantOrderParams);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('transactionAttributes', instance.transactionAttributes);
  writeNotNull('cardAuthInfo', instance.cardAuthInfo);
  writeNotNull('terminalId', instance.terminalId);
  writeNotNull('paymentAmountInfo', instance.paymentAmountInfo);
  writeNotNull('bankInfo', instance.bankInfo);
  writeNotNull('bindingInfo', instance.bindingInfo);
  writeNotNull('payerData', instance.payerData);
  writeNotNull('refunds', instance.refunds);
  return val;
}

const _$OrderStatusEnumMap = {
  OrderStatus.registeredNotPaid: 0,
  OrderStatus.preAuthorized: 1,
  OrderStatus.fullAuthorization: 2,
  OrderStatus.authorizationCanceled: 3,
  OrderStatus.refaundTransactions: 4,
  OrderStatus.authorizationThroughIssuingBank: 5,
  OrderStatus.authorizationDenied: 6,
};

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

const _$AvsCodeEnumMap = {
  AvsCode.a: 'A',
  AvsCode.b: 'B',
  AvsCode.c: 'С',
  AvsCode.d: 'D',
  AvsCode.e: 'E',
  AvsCode.f: 'F',
};

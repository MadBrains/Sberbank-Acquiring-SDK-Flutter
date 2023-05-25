// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      orderNumber: json['orderNumber'] as String,
      amount: json['amount'] as int,
      returnUrl: json['returnUrl'] as String,
      currency: json['currency'] as int?,
      failUrl: json['failUrl'] as String?,
      dynamicCallbackUrl: json['dynamicCallbackUrl'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      feeInput: json['feeInput'] as int?,
      pageView: json['pageView'] as String?,
      clientId: json['clientId'] as String?,
      merchantLogin: json['merchantLogin'] as String?,
      jsonParams: json['jsonParams'] as Map<String, dynamic>?,
      sessionTimeoutSecs: json['sessionTimeoutSecs'] as int?,
      expirationDate: json['expirationDate'] as String?,
      bindingId: json['bindingId'] as String?,
      features: $enumDecodeNullable(_$FeaturesEnumMap, json['features']),
      email: json['email'] as String?,
      phone: json['phone'] as int?,
      autocompletionDate: json['autocompletionDate'] as String?,
      billingPayerData: json['billingPayerData'] == null
          ? null
          : BillingPayerData.fromJson(
              json['billingPayerData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) {
  final val = <String, dynamic>{
    'orderNumber': instance.orderNumber,
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currency', instance.currency);
  val['returnUrl'] = instance.returnUrl;
  writeNotNull('failUrl', instance.failUrl);
  writeNotNull('dynamicCallbackUrl', instance.dynamicCallbackUrl);
  writeNotNull('description', instance.description);
  writeNotNull('language', instance.language);
  writeNotNull('feeInput', instance.feeInput);
  writeNotNull('pageView', instance.pageView);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('merchantLogin', instance.merchantLogin);
  val['jsonParams'] = RegisterRequest._jsonParamsToString(instance.jsonParams);
  writeNotNull('sessionTimeoutSecs', instance.sessionTimeoutSecs);
  writeNotNull('expirationDate', instance.expirationDate);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('features', _$FeaturesEnumMap[instance.features]);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('autocompletionDate', instance.autocompletionDate);
  writeNotNull('billingPayerData', instance.billingPayerData);
  return val;
}

const _$FeaturesEnumMap = {
  Features.autoPayment: 'AUTO_PAYMENT',
  Features.verify: 'VERIFY',
  Features.forceTDS: 'FORCE_TDS',
  Features.forceSSL: 'FORCE_SSL',
  Features.forceFullTDS: 'FORCE_FULL_TDS',
};

AppToApp _$AppToAppFromJson(Map<String, dynamic> json) => AppToApp(
      app2app: json['app2app'] as bool,
      osType: $enumDecode(_$OSTypeEnumMap, json['app.osType']),
      deepLink: json['app.deepLink'] as String,
    );

Map<String, dynamic> _$AppToAppToJson(AppToApp instance) => <String, dynamic>{
      'app2app': instance.app2app,
      'app.osType': _$OSTypeEnumMap[instance.osType]!,
      'app.deepLink': instance.deepLink,
    };

const _$OSTypeEnumMap = {
  OSType.ios: 'ios',
  OSType.android: 'android',
};

BackToApp _$BackToAppFromJson(Map<String, dynamic> json) => BackToApp(
      back2app: json['back2app'] as bool,
    );

Map<String, dynamic> _$BackToAppToJson(BackToApp instance) => <String, dynamic>{
      'back2app': instance.back2app,
    };

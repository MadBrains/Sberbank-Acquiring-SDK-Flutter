// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return RegisterRequest(
    orderNumber: json['orderNumber'] as String,
    amount: json['amount'] as int,
    currency: json['currency'] as int,
    returnUrl: json['returnUrl'] as String,
    failUrl: json['failUrl'] as String,
    description: json['description'] as String,
    language: json['language'] as String,
    pageView: json['pageView'] as String,
    clientId: json['clientId'] as String,
    merchantLogin: json['merchantLogin'] as String,
    jsonParams: json['jsonParams'] as Map<String, dynamic>,
    sessionTimeoutSecs: json['sessionTimeoutSecs'] as int,
    expirationDate: json['expirationDate'] as String,
    bindingId: json['bindingId'] as String,
    features: _$enumDecodeNullable(_$FeaturesEnumMap, json['features']),
    email: json['email'] as String,
    phone: json['phone'] as int,
  );
}

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('returnUrl', instance.returnUrl);
  writeNotNull('failUrl', instance.failUrl);
  writeNotNull('description', instance.description);
  writeNotNull('language', instance.language);
  writeNotNull('pageView', instance.pageView);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('merchantLogin', instance.merchantLogin);
  writeNotNull(
      'jsonParams', RegisterRequest._jsonParamsToString(instance.jsonParams));
  writeNotNull('sessionTimeoutSecs', instance.sessionTimeoutSecs);
  writeNotNull('expirationDate', instance.expirationDate);
  writeNotNull('bindingId', instance.bindingId);
  writeNotNull('features', _$FeaturesEnumMap[instance.features]);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$FeaturesEnumMap = {
  Features.autoPayment: 'AUTO_PAYMENT',
  Features.forceTDS: 'FORCE_TDS',
  Features.forceSSL: 'FORCE_SSL',
  Features.forceFullTDS: 'FORCE_FULL_TDS',
};

AppToApp _$AppToAppFromJson(Map<String, dynamic> json) {
  return AppToApp(
    app2app: json['app2app'] as bool,
    osType: _$enumDecodeNullable(_$OSTypeEnumMap, json['app.osType']),
    deepLink: json['app.deepLink'] as String,
  );
}

Map<String, dynamic> _$AppToAppToJson(AppToApp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('app2app', instance.app2app);
  writeNotNull('app.osType', _$OSTypeEnumMap[instance.osType]);
  writeNotNull('app.deepLink', instance.deepLink);
  return val;
}

const _$OSTypeEnumMap = {
  OSType.ios: 'ios',
  OSType.android: 'android',
};

BackToApp _$BackToAppFromJson(Map<String, dynamic> json) {
  return BackToApp(
    back2app: json['back2app'] as bool,
  );
}

Map<String, dynamic> _$BackToAppToJson(BackToApp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('back2app', instance.back2app);
  return val;
}

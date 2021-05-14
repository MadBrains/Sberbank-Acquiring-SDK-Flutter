// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardAuthInfo _$CardAuthInfoFromJson(Map<String, dynamic> json) {
  return CardAuthInfo(
    maskedPan: json['maskedPan'] as String?,
    approvalCode: json['approvalCode'] as String?,
    chargeback: json['chargeback'] as bool?,
    paymentSystem:
        _$enumDecodeNullable(_$PaymentSystemEnumMap, json['paymentSystem']),
    productCategory: json['productCategory'] as String?,
    product: json['product'] as String?,
    expiration: json['expiration'] as String?,
    cardholderName: json['cardholderName'] as String?,
    secureAuthInfo: json['secureAuthInfo'] == null
        ? null
        : SecureAuthInfo.fromJson(
            json['secureAuthInfo'] as Map<String, dynamic>),
    pan: json['pan'] as String?,
  );
}

Map<String, dynamic> _$CardAuthInfoToJson(CardAuthInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maskedPan', instance.maskedPan);
  writeNotNull('expiration', instance.expiration);
  writeNotNull('cardholderName', instance.cardholderName);
  writeNotNull('approvalCode', instance.approvalCode);
  writeNotNull('chargeback', instance.chargeback);
  writeNotNull('paymentSystem', _$PaymentSystemEnumMap[instance.paymentSystem]);
  writeNotNull('secureAuthInfo', instance.secureAuthInfo);
  writeNotNull('pan', instance.pan);
  writeNotNull('productCategory', instance.productCategory);
  writeNotNull('product', instance.product);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PaymentSystemEnumMap = {
  PaymentSystem.visa: 'VISA',
  PaymentSystem.mastercard: 'MASTERCARD',
  PaymentSystem.amex: 'AMEX',
  PaymentSystem.jcb: 'JCB',
  PaymentSystem.cup: 'CUP',
  PaymentSystem.mir: 'MIR',
};

SecureAuthInfo _$SecureAuthInfoFromJson(Map<String, dynamic> json) {
  return SecureAuthInfo(
    eci: json['eci'] as int?,
    threeDsInfo: json['threeDsInfo'] == null
        ? null
        : ThreeDsInfo.fromJson(json['threeDsInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SecureAuthInfoToJson(SecureAuthInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eci', instance.eci);
  writeNotNull('threeDsInfo', instance.threeDsInfo);
  return val;
}

ThreeDsInfo _$ThreeDsInfoFromJson(Map<String, dynamic> json) {
  return ThreeDsInfo(
    cavv: json['cavv'] as String?,
    xid: json['xid'] as String?,
  );
}

Map<String, dynamic> _$ThreeDsInfoToJson(ThreeDsInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cavv', instance.cavv);
  writeNotNull('xid', instance.xid);
  return val;
}

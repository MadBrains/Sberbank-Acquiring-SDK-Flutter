// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_receipt_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReceiptStatusResponse _$GetReceiptStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetReceiptStatusResponse(
    errorCode: json['errorCode'] as String?,
    errorMessage: json['errorMessage'] as String?,
    orderNumber: json['orderNumber'] as String?,
    orderId: json['orderId'] as String?,
    daemonCode: json['daemonCode'] as String?,
    ecrRegistrationNumber: json['ecr_registration_number'] as String?,
    receipt: json['receipt'] == null
        ? null
        : Receipt.fromJson(json['receipt'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetReceiptStatusResponseToJson(
    GetReceiptStatusResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('daemonCode', instance.daemonCode);
  writeNotNull('ecr_registration_number', instance.ecrRegistrationNumber);
  writeNotNull('receipt', instance.receipt);
  return val;
}

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    receiptStatus:
        _$enumDecodeNullable(_$ReceiptStatusEnumMap, json['receiptStatus']),
    uuid: json['uuid'] as String?,
    shiftNumber: json['shift_number'] as int?,
    receiptNumber: json['receipt_number'] as int?,
    receiptDatetime: json['receipt_datetime'] as String?,
    fnNumber: json['fn_number'] as String?,
    ecrRegistrationNumber: json['ecr_registration_number'] as String?,
    fiscalDocumentNumber: json['fiscal_document_number'] as int?,
    fiscalDocumentAttribute: json['fiscal_document_attribute'] as String?,
    amountTotal: json['amount_total'] as String?,
    serialNumber: json['serial_number'] as String?,
    fnsSite: json['fnsSite'] as String?,
    ofd: json['OFD'] == null
        ? null
        : OFD.fromJson(json['OFD'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('receiptStatus', _$ReceiptStatusEnumMap[instance.receiptStatus]);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('shift_number', instance.shiftNumber);
  writeNotNull('receipt_number', instance.receiptNumber);
  writeNotNull('receipt_datetime', instance.receiptDatetime);
  writeNotNull('fn_number', instance.fnNumber);
  writeNotNull('ecr_registration_number', instance.ecrRegistrationNumber);
  writeNotNull('fiscal_document_number', instance.fiscalDocumentNumber);
  writeNotNull('fiscal_document_attribute', instance.fiscalDocumentAttribute);
  writeNotNull('amount_total', instance.amountTotal);
  writeNotNull('serial_number', instance.serialNumber);
  writeNotNull('fnsSite', instance.fnsSite);
  writeNotNull('OFD', instance.ofd);
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

const _$ReceiptStatusEnumMap = {
  ReceiptStatus.paymentSent: 0,
  ReceiptStatus.paymentDelivered: 1,
  ReceiptStatus.paymentError: 2,
  ReceiptStatus.refundSent: 3,
  ReceiptStatus.refundDelivered: 4,
  ReceiptStatus.refundError: 5,
};

OFD _$OFDFromJson(Map<String, dynamic> json) {
  return OFD(
    name: json['name'] as String?,
    website: json['website'] as String?,
    inn: json['INN'] as String?,
  );
}

Map<String, dynamic> _$OFDToJson(OFD instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('website', instance.website);
  writeNotNull('INN', instance.inn);
  return val;
}

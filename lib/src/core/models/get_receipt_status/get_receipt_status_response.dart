import 'package:json_annotation/json_annotation.dart';

import 'package:sberbank_acquiring/src/core/models/enums/receipt_status.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../base/base_response.dart';

part 'get_receipt_status_response.g.dart';

/// {@template get_receipt_status_response}
/// Ответ сведений о кассовом чеке.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetReceiptStatusResponse extends AcquiringResponse {
  /// {@macro get_receipt_status_response}
  GetReceiptStatusResponse({
    String? errorCode,
    String? errorMessage,
    this.orderNumber,
    this.orderId,
    this.daemonCode,
    this.ecrRegistrationNumber,
    this.receipt,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory GetReceiptStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReceiptStatusResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetReceiptStatusResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.orderId: orderId,
        JsonKeys.daemonCode: daemonCode,
        JsonKeys.ecrRegistrationNumber: ecrRegistrationNumber,
        JsonKeys.receipt: receipt,
      };

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  @JsonKey(name: JsonKeys.orderNumber)
  final String? orderNumber;

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Наименование сервера.
  @JsonKey(name: JsonKeys.daemonCode)
  final String? daemonCode;

  /// Регистрационный номер контрольно-кассовой техники.
  @JsonKey(name: JsonKeys.ecrRegistrationNumber)
  final String? ecrRegistrationNumber;

  /// {@macro receipt}
  @JsonKey(name: JsonKeys.receipt)
  final Receipt? receipt;
}

/// {@template receipt}
/// Блок с параметрами чека.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Receipt extends BaseResponse {
  /// {@macro receipt}
  Receipt({
    this.receiptStatus,
    this.uuid,
    this.shiftNumber,
    this.receiptNumber,
    this.receiptDatetime,
    this.fnNumber,
    this.ecrRegistrationNumber,
    this.fiscalDocumentNumber,
    this.fiscalDocumentAttribute,
    this.amountTotal,
    this.serialNumber,
    this.fnsSite,
    this.ofd,
  });

  /// {@macro fromJson}
  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.receiptStatus: receiptStatus,
        JsonKeys.uuid: uuid,
        JsonKeys.shiftNumber: shiftNumber,
        JsonKeys.receiptNumber: receiptNumber,
        JsonKeys.receiptDatetime: receiptDatetime,
        JsonKeys.fnNumber: fnNumber,
        JsonKeys.ecrRegistrationNumber: ecrRegistrationNumber,
        JsonKeys.fiscalDocumentNumber: fiscalDocumentNumber,
        JsonKeys.fiscalDocumentAttribute: fiscalDocumentAttribute,
        JsonKeys.amountTotal: amountTotal,
        JsonKeys.serialNumber: serialNumber,
        JsonKeys.fnsSite: fnsSite,
        JsonKeys.ofd: ofd,
      };

  /// {@macro receipt_status}
  @JsonKey(name: JsonKeys.receiptStatus)
  final ReceiptStatus? receiptStatus;

  /// Идентификатор чека в фискализаторе.
  @JsonKey(name: JsonKeys.uuid)
  final String? uuid;

  /// Номер смены.
  @JsonKey(name: JsonKeys.shiftNumber)
  final int? shiftNumber;

  /// Номер чека в смене.
  @JsonKey(name: JsonKeys.receiptNumber)
  final int? receiptNumber;

  /// Дата и время чека в фискальном накопителе.
  @JsonKey(name: JsonKeys.receiptDatetime)
  final String? receiptDatetime;

  /// Номер фискального накопителя.
  @JsonKey(name: JsonKeys.fnNumber)
  final String? fnNumber;

  /// Регистрационный номер контрольно-кассовой техники.
  @JsonKey(name: JsonKeys.ecrRegistrationNumber)
  final String? ecrRegistrationNumber;

  /// Фискальный номер документа.
  @JsonKey(name: JsonKeys.fiscalDocumentNumber)
  final int? fiscalDocumentNumber;

  /// Фискальный признак документа.
  @JsonKey(name: JsonKeys.fiscalDocumentAttribute)
  final String? fiscalDocumentAttribute;

  /// Итоговая сумма чека в рублях.
  @JsonKey(name: JsonKeys.amountTotal)
  final String? amountTotal;

  /// Заводской номер контрольно-кассовой техники.
  @JsonKey(name: JsonKeys.serialNumber)
  final String? serialNumber;

  /// Адрес сайта ФНС.
  @JsonKey(name: JsonKeys.fnsSite)
  final String? fnsSite;

  /// {@macro ofd}
  @JsonKey(name: JsonKeys.ofd)
  final OFD? ofd;
}

/// {@template ofd}
/// Блок с параметрами оператора фискальных данных.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class OFD extends BaseResponse {
  /// {@macro ofd}
  OFD({
    this.name,
    this.website,
    this.inn,
  });

  /// {@macro fromJson}
  factory OFD.fromJson(Map<String, dynamic> json) => _$OFDFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OFDToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.name: name,
        JsonKeys.website: website,
        JsonKeys.inn: inn,
      };

  /// Наименование оператора фискальных данных.
  @JsonKey(name: JsonKeys.name)
  final String? name;

  /// Сайт оператора фискальных данных.
  @JsonKey(name: JsonKeys.website)
  final String? website;

  /// Идентификационный номер налогоплательщика оператора фискальных данных.
  @JsonKey(name: JsonKeys.inn)
  final String? inn;
}

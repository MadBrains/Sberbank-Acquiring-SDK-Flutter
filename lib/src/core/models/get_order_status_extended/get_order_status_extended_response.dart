import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../common/attribute.dart';
import '../common/bank_info.dart';
import '../common/binding_info.dart';
import '../common/card_auth_info.dart';
import '../common/payer_data.dart';
import '../common/payment_amount_info.dart';
import '../common/refunds.dart';
import '../enums/avs_code.dart';
import '../enums/order_status.dart';
import '../enums/payment_way.dart';

part 'get_order_status_extended_response.g.dart';

/// {@template get_order_status_extended_response}
/// Ответ состояния заказа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetOrderStatusExtendedResponse extends AcquiringResponse {
  /// {@macro get_order_status_extended_response}
  GetOrderStatusExtendedResponse({
    String? errorCode,
    String? errorMessage,
    this.orderNumber,
    this.orderStatus,
    this.actionCode,
    this.actionCodeDescription,
    this.amount,
    this.currency,
    this.date,
    this.depositedDate,
    this.orderDescription,
    this.ip,
    this.authRefNum,
    this.refundedDate,
    this.paymentWay,
    this.avsCode,
    this.merchantOrderParams,
    this.attributes,
    this.transactionAttributes,
    this.cardAuthInfo,
    this.terminalId,
    this.paymentAmountInfo,
    this.bankInfo,
    this.bindingInfo,
    this.payerData,
    this.refunds,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory GetOrderStatusExtendedResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrderStatusExtendedResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetOrderStatusExtendedResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.orderStatus: orderStatus,
        JsonKeys.actionCode: actionCode,
        JsonKeys.actionCodeDescription: actionCodeDescription,
        JsonKeys.amount: amount,
        JsonKeys.currency: currency,
        JsonKeys.date: date,
        JsonKeys.depositedDate: depositedDate,
        JsonKeys.orderDescription: orderDescription,
        JsonKeys.ip: ip,
        JsonKeys.authRefNum: authRefNum,
        JsonKeys.refundedDate: refundedDate,
        JsonKeys.paymentWay: paymentWay,
        JsonKeys.avsCode: avsCode,
        JsonKeys.merchantOrderParams: merchantOrderParams,
        JsonKeys.attributes: attributes,
        JsonKeys.transactionAttributes: transactionAttributes,
        JsonKeys.cardAuthInfo: cardAuthInfo,
        JsonKeys.terminalId: terminalId,
        JsonKeys.paymentAmountInfo: paymentAmountInfo,
        JsonKeys.bankInfo: bankInfo,
        JsonKeys.bindingInfo: bindingInfo,
        JsonKeys.payerData: payerData,
        JsonKeys.refunds: refunds,
      };

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String? orderNumber;

  /// {@macro order_status}
  @JsonKey(name: JsonKeys.orderStatus)
  final OrderStatus? orderStatus;

  /// Код ответа процессинга.
  @JsonKey(name: JsonKeys.actionCode)
  final int? actionCode;

  /// Коды ответа - цифровое обозначение результата, к которому привело обращение к системе со стороны пользователя.
  @JsonKey(name: JsonKeys.actionCodeDescription)
  final String? actionCodeDescription;

  /// Сумма платежа в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// Код валюты платежа ISO 4217. Если не указано, то используется значение по умолчанию.
  @JsonKey(name: JsonKeys.currency)
  final String? currency;

  /// Дата регистрации заказа в формате UNIX-времени (POSIX-времени).
  @JsonKey(name: JsonKeys.date)
  final int? date;

  /// Дата оплаты заказа в формате UNIX-времени (POSIX-времени).
  @JsonKey(name: JsonKeys.depositedDate)
  final int? depositedDate;

  /// Описание заказа в свободной форме.
  @JsonKey(name: JsonKeys.orderDescription)
  final String? orderDescription;

  /// IP-адрес покупателя. IPv6 поддерживается во всех запросах (до 39 символов).
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Учётный номер авторизации платежа, который присваивается при регистрации платежа.
  @JsonKey(name: JsonKeys.authRefNum)
  final String? authRefNum;

  /// Дата и время возврата средств.
  @JsonKey(name: JsonKeys.refundedDate)
  final String? refundedDate;

  /// {@macro payment_way}
  @JsonKey(name: JsonKeys.paymentWay)
  final PaymentWay? paymentWay;

  /// {@macro avs_code}
  @JsonKey(name: JsonKeys.avsCode)
  final AvsCode? avsCode;

  /// Параметры продавца
  @JsonKey(name: JsonKeys.merchantOrderParams)
  final List<Attribute>? merchantOrderParams;

  /// {@macro attribute}
  @JsonKey(name: JsonKeys.attributes)
  final List<Attribute>? attributes;

  /// Сведения о деталях заказа.
  @JsonKey(name: JsonKeys.transactionAttributes)
  final List<Attribute>? transactionAttributes;

  /// {@macro card_auth_info}
  @JsonKey(name: JsonKeys.cardAuthInfo)
  final CardAuthInfo? cardAuthInfo;

  /// Идентификатор терминала в процессинге, через который осуществлялась оплата.
  @JsonKey(name: JsonKeys.terminalId)
  final String? terminalId;

  /// {@macro payment_amount_info}
  @JsonKey(name: JsonKeys.paymentAmountInfo)
  final PaymentAmountInfo? paymentAmountInfo;

  /// {@macro bank_info}
  @JsonKey(name: JsonKeys.bankInfo)
  final BankInfo? bankInfo;

  /// {@macro binding_info}
  @JsonKey(name: JsonKeys.bindingInfo)
  final BindingInfo? bindingInfo;

  /// {@macro payer_data}
  @JsonKey(name: JsonKeys.payerData)
  final PayerData? payerData;

  /// {@macro refunds}
  @JsonKey(name: JsonKeys.refunds)
  final Refunds? refunds;
}

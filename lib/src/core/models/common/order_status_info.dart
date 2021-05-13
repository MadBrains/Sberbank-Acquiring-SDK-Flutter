import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../enums/order_status.dart';
import '../base/base_response.dart';
import 'attribute.dart';
import 'bank_info.dart';
import 'card_auth_info.dart';
import 'payment_amount_info.dart';

part 'order_status_info.g.dart';

/// {@template order_status}
/// Статус заказа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class OrderStatusInfo extends BaseResponse {
  /// {@macro order_status}
  OrderStatusInfo({
    this.errorCode,
    this.orderNumber,
    this.orderStatus,
    this.actionCode,
    this.actionCodeDescription,
    this.amount,
    this.currency,
    this.date,
    this.merchantOrderParams,
    this.attributes,
    this.cardAuthInfo,
    this.terminalId,
    this.authDateTime,
    this.authRefNum,
    this.paymentAmountInfo,
    this.bankInfo,
  });

  /// {@macro fromJson}
  factory OrderStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderStatusInfoToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.errorCode: errorCode,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.orderStatus: orderStatus,
        JsonKeys.actionCode: actionCode,
        JsonKeys.actionCodeDescription: actionCodeDescription,
        JsonKeys.amount: amount,
        JsonKeys.currency: currency,
        JsonKeys.date: date,
        JsonKeys.merchantOrderParams: merchantOrderParams,
        JsonKeys.attributes: attributes,
        JsonKeys.cardAuthInfo: cardAuthInfo,
        JsonKeys.terminalId: terminalId,
        JsonKeys.authDateTime: authDateTime,
        JsonKeys.authRefNum: authRefNum,
        JsonKeys.paymentAmountInfo: paymentAmountInfo,
        JsonKeys.bankInfo: bankInfo,
      };

  /// Код ошибки. Может отсутствовать, если результат не привёл к ошибке.
  @JsonKey(name: JsonKeys.errorCode)
  final int errorCode;

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String orderNumber;

  /// {@macro order_status}
  @JsonKey(name: JsonKeys.orderStatus)
  final OrderStatus orderStatus;

  /// Код ответа процессинга.
  @JsonKey(name: JsonKeys.actionCode)
  final int actionCode;

  /// Коды ответа - цифровое обозначение результата, к которому привело обращение к системе со стороны пользователя.
  @JsonKey(name: JsonKeys.actionCodeDescription)
  final String actionCodeDescription;

  /// Сумма платежа в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Код валюты платежа ISO 4217. Если не указано, то используется значение по умолчанию.
  @JsonKey(name: JsonKeys.currency)
  final int currency;

  /// Дата регистрации заказа в формате UNIX-времени (POSIX-времени).
  @JsonKey(name: JsonKeys.date)
  final String date;

  /// Параметры продавца
  @JsonKey(name: JsonKeys.merchantOrderParams)
  final List<Attribute> merchantOrderParams;

  /// {@macro attribute}
  @JsonKey(name: JsonKeys.attributes)
  final List<Attribute> attributes;

  /// {@macro card_auth_info}
  @JsonKey(name: JsonKeys.cardAuthInfo)
  final CardAuthInfo cardAuthInfo;

  /// Идентификатор терминала в процессинге, через который осуществлялась оплата.
  @JsonKey(name: JsonKeys.terminalId)
  final String terminalId;

  /// Дата и время авторизации в формате UNIX-времени (POSIX-времени).
  @JsonKey(name: JsonKeys.authDateTime)
  final String authDateTime;

  /// Учётный номер авторизации платежа, который присваивается при регистрации платежа.
  @JsonKey(name: JsonKeys.authRefNum)
  final String authRefNum;

  /// {@macro payment_amount_info}
  @JsonKey(name: JsonKeys.paymentAmountInfo)
  final PaymentAmountInfo paymentAmountInfo;

  /// {@macro bank_info}
  @JsonKey(name: JsonKeys.bankInfo)
  final BankInfo bankInfo;
}

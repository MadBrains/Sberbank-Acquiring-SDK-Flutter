import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'apple_pay_request.g.dart';

/// {@template apple_pay_request}
/// Запрос оплаты через Apple Pay
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ApplePayRequest extends AcquiringRequest {
  /// {@macro apple_pay_request}
  ApplePayRequest({
    @required this.merchant,
    this.orderNumber,
    this.description,
    this.language,
    this.additionalParameters,
    this.preAuth,
    @required this.paymentToken,
  });

  /// {@macro fromJson}
  factory ApplePayRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplePayRequestFromJson(json);

  @override
  Map<String, String> get headers => <String, String>{
        'content-type': 'application/json',
      };

  @override
  String get apiMethod => ApiMethods.applePay;

  @override
  Map<String, dynamic> toJson() => _$ApplePayRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.merchant: merchant,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.description: description,
        JsonKeys.language: language,
        JsonKeys.additionalParameters: additionalParameters,
        JsonKeys.preAuth: preAuth,
        JsonKeys.paymentToken: paymentToken,
      };

  @override
  ApplePayRequest copyWith({
    String merchant,
    String orderNumber,
    String description,
    String language,
    Map<String, dynamic> additionalParameters,
    bool preAuth,
    String paymentToken,
  }) {
    return ApplePayRequest(
      merchant: merchant ?? this.merchant,
      orderNumber: orderNumber ?? this.orderNumber,
      description: description ?? this.description,
      language: language ?? this.language,
      additionalParameters: additionalParameters ?? this.additionalParameters,
      preAuth: preAuth ?? this.preAuth,
      paymentToken: paymentToken ?? this.paymentToken,
    );
  }

  @override
  void validate() {
    assert(merchant != null);
    assert(paymentToken != null);
  }

  /// Логин продавца в платёжном шлюзе
  @JsonKey(name: JsonKeys.merchant)
  final String merchant;

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String orderNumber;

  /// Описание заказа в свободной форме.
  @JsonKey(name: JsonKeys.description)
  final String description;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String language;

  /// Дополнительные параметры заказа, которые сохраняются для просмотра из личного кабинета продавца.
  ///
  /// Если у продавца настроена фискализация, при указании в качестве дополнительных параметров email (адрес электронной почты покупателя)
  /// и/или phone (номер сотового телефона покупателя) эти параметры в первую очередь используются для отправки фискального чека.
  @JsonKey(name: JsonKeys.additionalParameters)
  final Map<String, dynamic> additionalParameters;

  /// Параметр, определяющий необходимость предварительной авторизации (блокирования средств на счёте клиента до их списания).
  /// Доступны следующие значения:
  /// - `true` (истина) - параметр включён, производится двухстадийная оплата;
  /// - `false` (ложь) - параметр выключен, производится одностадийная оплата (средства списываются сразу).
  ///
  /// Если параметр не указан в запросе, происходит одностадийная оплата.
  @JsonKey(name: JsonKeys.preAuth)
  final bool preAuth;

  /// Параметр paymentToken должен содержать закодированное в Base64 значение свойства paymentData,
  /// полученного из объекта PKPaymentToken Object от системы Apple Pay (подробнее см. документацию Apple Pay).
  ///
  /// Таким образом, чтобы сделать запрос на оплату в платёжный шлюз, продавец должен:
  /// 1. получить от системы Apple Pay объект PKPaymentToken Object, содержащий свойство paymentData;
  /// 2. извлечь значение свойства paymentData и закодировать его в Base64;
  /// 3. включить закодированное значение свойства paymentData в качестве значения парамера paymentToken в запросе на оплату, который продавец направит в платёжный шлюз.
  ///
  /// Примечание: можно воспользоваться пакетом [mad_pay](https://pub.dev/packages/mad_pay)
  @JsonKey(name: JsonKeys.paymentToken)
  final String paymentToken;
}

import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'google_pay_request.g.dart';

/// {@template google_pay_request}
/// Запрос на оплату с помощью Google Pay
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GooglePayRequest extends AcquiringRequest {
  /// {@macro google_pay_request}
  GooglePayRequest({
    required this.merchant,
    required this.paymentToken,
    required this.amount,
    required this.returnUrl,
    this.failUrl,
    this.orderNumber,
    this.description,
    this.language,
    this.additionalParameters,
    this.preAuth,
    this.clientId,
    this.ip,
    this.currencyCode,
    this.email,
    this.phone,
  });

  /// {@macro fromJson}
  factory GooglePayRequest.fromJson(Map<String, dynamic> json) =>
      _$GooglePayRequestFromJson(json);

  @override
  Map<String, String> get headers => <String, String>{
        'content-type': 'application/json',
      };

  @override
  String get apiMethod => ApiMethods.googlePay;

  @override
  Map<String, dynamic> toJson() => _$GooglePayRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.merchant: merchant,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.description: description,
        JsonKeys.language: language,
        JsonKeys.additionalParameters: additionalParameters,
        JsonKeys.preAuth: preAuth,
        JsonKeys.clientId: clientId,
        JsonKeys.paymentToken: paymentToken,
        JsonKeys.ip: ip,
        JsonKeys.amount: amount,
        JsonKeys.currencyCode: currencyCode,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
        JsonKeys.returnUrl: returnUrl,
        JsonKeys.failUrl: failUrl,
      };

  @override
  GooglePayRequest copyWith({
    String? merchant,
    String? orderNumber,
    String? description,
    String? language,
    Map<String, dynamic>? additionalParameters,
    bool? preAuth,
    String? clientId,
    String? paymentToken,
    String? ip,
    int? amount,
    String? currencyCode,
    String? email,
    int? phone,
    String? returnUrl,
    String? failUrl,
  }) {
    return GooglePayRequest(
      merchant: merchant ?? this.merchant,
      orderNumber: orderNumber ?? this.orderNumber,
      description: description ?? this.description,
      language: language ?? this.language,
      additionalParameters: additionalParameters ?? this.additionalParameters,
      preAuth: preAuth ?? this.preAuth,
      clientId: clientId ?? this.clientId,
      paymentToken: paymentToken ?? this.paymentToken,
      ip: ip ?? this.ip,
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      returnUrl: returnUrl ?? this.returnUrl,
      failUrl: failUrl ?? this.failUrl,
    );
  }

  @override
  void validate() {}

  /// Логин продавца в платёжном шлюзе
  @JsonKey(name: JsonKeys.merchant)
  final String merchant;

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String? orderNumber;

  /// Описание заказа в свободной форме.
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;

  /// Дополнительные параметры заказа, которые сохраняются для просмотра из личного кабинета продавца.
  ///
  /// Если у продавца настроена фискализация, при указании в качестве дополнительных параметров email (адрес электронной почты покупателя)
  /// и/или phone (номер сотового телефона покупателя) эти параметры в первую очередь используются для отправки фискального чека.
  @JsonKey(name: JsonKeys.additionalParameters)
  final Map<String, dynamic>? additionalParameters;

  /// Параметр, определяющий необходимость предварительной авторизации (блокирования средств на счёте клиента до их списания).
  /// Доступны следующие значения:
  /// - `true` (истина) - параметр включён, производится двухстадийная оплата;
  /// - `false` (ложь) - параметр выключен, производится одностадийная оплата (средства списываются сразу).
  ///
  /// Если параметр не указан в запросе, происходит одностадийная оплата.
  @JsonKey(name: JsonKeys.preAuth)
  final bool? preAuth;

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функционала связок.
  /// Может присутствовать, если магазину разрешено создание связок.
  ///
  /// Указание этого параметра при платежах по связке необходимо - в противном случае платёж будет неуспешен.
  @JsonKey(name: JsonKeys.clientId)
  final String? clientId;

  /// Токен, полученный от Google Pay и закодированный в Base64.
  ///
  /// Примечание: можно воспользоваться пакетом [mad_pay](https://pub.dev/packages/mad_pay)
  @JsonKey(name: JsonKeys.paymentToken)
  final String paymentToken;

  /// IP-адрес покупателя. IPv6 поддерживается во всех запросах (до 39 символов).
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Сумма платежа в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Цифровой код валюты платежа ISO 4217.
  /// Если не указан, считается равным коду валюты по умолчанию.
  @JsonKey(name: JsonKeys.currencyCode)
  final String? currencyCode;

  /// Адрес электронной почты покупателя.
  /// Можно указать несколько адресов электронной почты через запятую и без пробелов - в этом случае чек будет отправлен на все указанные адреса.
  ///
  /// Обязателен, если у интернет-магазина настроена фискализация и не указан номер телефона.
  @JsonKey(name: JsonKeys.email)
  final String? email;

  /// Номер телефона клиента. Может быть следующего формата: ^((+7|7|8)?([0-9]){10})$. Допустимое количество цифр: от 7 до 15.
  /// Примеры:
  /// - +79000000000
  /// - 89000000000
  /// - 9000000000
  /// - 79000000000
  ///
  /// В случае передачи номера в отдельном параметре и в дополнительных параметрах, в качестве основного использоваться будет номер, указанный в настоящем параметре phone.
  ///
  /// Обязателен, если у интернет-магазина настроена фискализация и не указан адрес электронной почты.
  @JsonKey(name: JsonKeys.phone)
  final int? phone;

  /// Адрес, на который требуется перенаправить пользователя в случае успешной оплаты.
  /// Адрес должен быть указан полностью, включая используемый протокол (например, https://test.ru вместо test.ru).
  /// В противном случае пользователь будет перенаправлен по адресу следующего вида: http://<адрес_платёжного_шлюза>/<адрес_продавца>.
  @JsonKey(name: JsonKeys.returnUrl)
  final String returnUrl;

  /// Адрес, на который требуется перенаправить пользователя в случае неуспешной оплаты.
  /// Адрес должен быть указан полностью, включая используемый протокол (например, https://test.ru вместо test.ru).
  /// В противном случае пользователь будет перенаправлен по адресу следующего вида: http://<адрес_платёжного_шлюза>/<адрес_продавца>.
  @JsonKey(name: JsonKeys.failUrl)
  final String? failUrl;
}

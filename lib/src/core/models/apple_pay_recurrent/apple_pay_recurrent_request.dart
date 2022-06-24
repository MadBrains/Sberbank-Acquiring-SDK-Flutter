import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';
import '../common/billing_payer_data.dart';

part 'apple_pay_recurrent_request.g.dart';

/// {@template apple_pay_recurrent_request}
/// Запрос на проведение рекуррентных платежей Apple Pay
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ApplePayRecurrentRequest extends AcquiringRequest {
  /// {@macro apple_pay_recurrent_request}
  ApplePayRecurrentRequest({
    required this.orderNumber,
    required this.bindingId,
    required this.amount,
    this.feeInput,
    this.language,
    this.currency,
    this.description,
    this.additionalParameters,
    this.billingPayerData,
  });

  /// {@macro fromJson}
  factory ApplePayRecurrentRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplePayRecurrentRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.applePayRecurrent;

  @override
  Map<String, dynamic> toJson() => _$ApplePayRecurrentRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.feeInput: feeInput,
        JsonKeys.language: language,
        JsonKeys.bindingId: bindingId,
        JsonKeys.amount: amount,
        JsonKeys.currency: currency,
        JsonKeys.description: description,
        JsonKeys.additionalParameters: additionalParameters,
        JsonKeys.billingPayerData: billingPayerData,
      };

  @override
  ApplePayRecurrentRequest copyWith({
    String? orderNumber,
    int? feeInput,
    String? language,
    String? bindingId,
    int? amount,
    int? currency,
    String? description,
    Map<String, dynamic>? additionalParameters,
    BillingPayerData? billingPayerData,
  }) {
    return ApplePayRecurrentRequest(
      orderNumber: orderNumber ?? this.orderNumber,
      feeInput: feeInput ?? this.feeInput,
      language: language ?? this.language,
      bindingId: bindingId ?? this.bindingId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      additionalParameters: additionalParameters ?? this.additionalParameters,
      billingPayerData: billingPayerData ?? this.billingPayerData,
    );
  }

  @override
  void validate() {}

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String orderNumber;

  /// Сумма комиссии в минимальных единицах валюты.
  ///
  /// Параметр передается только при включении соответствующей пермиссии.
  @JsonKey(name: JsonKeys.feeInput)
  final int? feeInput;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;

  /// Идентификатор связки, созданной ранее.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;

  /// Сумма платежа в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Код валюты платежа ISO 4217. Если не указано, то используется значение по умолчанию.
  @JsonKey(name: JsonKeys.currency)
  final int? currency;

  /// Описание заказа в свободной форме.
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Дополнительные параметры заказа, которые сохраняются для просмотра из личного кабинета продавца.
  ///
  /// Если у продавца настроена фискализация, при указании в качестве дополнительных параметров email (адрес электронной почты покупателя)
  /// и/или phone (номер сотового телефона покупателя) эти параметры в первую очередь используются для отправки фискального чека.
  @JsonKey(name: JsonKeys.additionalParameters)
  final Map<String, dynamic>? additionalParameters;

  /// {@macro billing_payer_data}
  @JsonKey(name: JsonKeys.billingPayerData)
  final BillingPayerData? billingPayerData;
}

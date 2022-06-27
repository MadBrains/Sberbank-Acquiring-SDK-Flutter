import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'create_binding_no_payment_request.g.dart';

/// {@template create_binding_no_payment_request}
/// Запрос создания связки без проведения платежа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class CreateBindingNoPaymentRequest extends AcquiringRequest {
  /// {@macro create_binding_no_payment_request}
  CreateBindingNoPaymentRequest({
    required this.clientId,
    required this.cardholderName,
    required this.expiryDate,
    required this.pan,
    this.additionalParameters,
  });

  /// {@macro fromJson}
  factory CreateBindingNoPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBindingNoPaymentRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.createBindingNoPayment;

  @override
  Map<String, dynamic> toJson() => _$CreateBindingNoPaymentRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.clientId: clientId,
        JsonKeys.cardholderName: cardholderName,
        JsonKeys.expiryDate: expiryDate,
        JsonKeys.pan: pan,
        JsonKeys.additionalParameters: additionalParameters,
      };

  @override
  CreateBindingNoPaymentRequest copyWith({
    String? clientId,
    String? cardholderName,
    int? expiryDate,
    String? pan,
    Map<String, dynamic>? additionalParameters,
  }) {
    return CreateBindingNoPaymentRequest(
      clientId: clientId ?? this.clientId,
      cardholderName: cardholderName ?? this.cardholderName,
      expiryDate: expiryDate ?? this.expiryDate,
      pan: pan ?? this.pan,
      additionalParameters: additionalParameters ?? this.additionalParameters,
    );
  }

  @override
  void validate() {}

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функциональности связок.
  @JsonKey(name: JsonKeys.clientId)
  final String clientId;

  /// Имя держателя карты латиницей, если доступно.
  @JsonKey(name: JsonKeys.cardholderName)
  final String cardholderName;

  /// Срок истечения действия карты в формате ГГГГММ. Указан только после оплаты заказа.
  @JsonKey(name: JsonKeys.expiryDate)
  final int expiryDate;

  /// Номер платёжной карты.
  @JsonKey(name: JsonKeys.pan)
  final String pan;

  /// Дополнительные параметры заказа, которые сохраняются для просмотра из личного кабинета продавца.
  /// Дополнительные параметры следует указывать в следующем формате. «имя_параметра»: «значение_параметра»
  /// Каждую новую пару имени и значения параметра следует отделять запятой.
  ///
  /// Если у продавца настроена фискализация, при указании в качестве дополнительных параметров
  /// email (адрес электронной почты покупателя) и/или phone (номер сотового телефона покупателя)
  /// эти параметры в первую очередь используются для отправки фискального чека.
  ///
  /// В параметре запрещено передавать зарезервированные имена (в случае их передачи заказ может быть отклонен):
  /// - sbrf_spasibo:amount_bonus
  /// - sbrf_sbermiles:amount_bonus
  /// - loyaltyId
  @JsonKey(name: JsonKeys.additionalParameters)
  final Map<String, dynamic>? additionalParameters;
}

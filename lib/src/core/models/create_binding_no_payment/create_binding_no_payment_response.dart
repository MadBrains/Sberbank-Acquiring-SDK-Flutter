import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'create_binding_no_payment_response.g.dart';

/// {@template create_binding_no_payment_response}
/// Ответ создания связки без проведения платежа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class CreateBindingNoPaymentResponse extends AcquiringResponse {
  /// {@macro create_binding_no_payment_response}
  CreateBindingNoPaymentResponse({
    String? errorCode,
    String? errorMessage,
    this.bindingId,
    this.clientId,
    this.cardholderName,
    this.expiryDate,
    this.maskedPan,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory CreateBindingNoPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBindingNoPaymentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateBindingNoPaymentResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.bindingId: bindingId,
        JsonKeys.clientId: clientId,
        JsonKeys.cardholderName: cardholderName,
        JsonKeys.expiryDate: expiryDate,
        JsonKeys.maskedPan: maskedPan,
      };

  /// Идентификатор связки созданной при оплате заказа или использованной для оплаты.
  /// Присутствует только если магазину разрешено создание связок.
  @JsonKey(name: JsonKeys.bindingId)
  final String? bindingId;

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функциональности связок.
  @JsonKey(name: JsonKeys.clientId)
  final String? clientId;

  /// Имя держателя карты латиницей, если доступно.
  @JsonKey(name: JsonKeys.cardholderName)
  final String? cardholderName;

  /// Срок истечения действия карты в формате ГГГГММ. Указан только после оплаты заказа.
  @JsonKey(name: JsonKeys.expiryDate)
  final int? expiryDate;

  /// Маскированный номер карты, которая использовалась для оплаты.
  @JsonKey(name: JsonKeys.maskedPan)
  final String? maskedPan;
}

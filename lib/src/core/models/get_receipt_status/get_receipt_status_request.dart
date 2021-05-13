import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_receipt_status_request.g.dart';

/// {@template get_receipt_status_request}
/// Запрос сведений о кассовом чеке.
///
/// В запросе могут передаваться следующие данные:
/// - идентификатор заказа - orderId или orderNumber;
/// - идентификатор чека - uuid.
///
/// Если передан идентификатор заказа (orderId или orderNumber), ответ возвращает все чеки данного заказа.
/// При передаче только идентификатора чека ответ возвращает сведения только о данном чеке.
/// Если указаны и идентификатор заказа, и чека, ответ возвращает все чеки заказа.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetReceiptStatusRequest extends AcquiringRequest {
  /// {@macro get_receipt_status_request}
  GetReceiptStatusRequest({
    this.orderId,
    this.orderNumber,
    this.uuid,
    this.language,
  });

  /// {@macro fromJson}
  factory GetReceiptStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$GetReceiptStatusRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getReceiptStatus;

  @override
  Map<String, dynamic> toJson() => _$GetReceiptStatusRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.orderId: orderId,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.uuid: uuid,
        JsonKeys.language: language,
      };

  @override
  GetReceiptStatusRequest copyWith({
    String orderId,
    String orderNumber,
    String uuid,
    String language,
  }) {
    return GetReceiptStatusRequest(
      orderId: orderId ?? this.orderId,
      orderNumber: orderNumber ?? this.orderNumber,
      uuid: uuid ?? this.uuid,
      language: language ?? this.language,
    );
  }

  @override
  void validate() {
    assert(orderId != null || orderNumber != null || uuid != null);
  }

  /// Номер заказа в платёжной системе. Уникален в пределах системы.
  /// Отсутствует, если регистрация заказа на удалась по причине ошибки.
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Номер (идентификатор) заказа в системе магазина.
  @JsonKey(name: JsonKeys.orderNumber)
  final String orderNumber;

  /// Идентификатор чека в фискализаторе.
  @JsonKey(name: JsonKeys.uuid)
  final String uuid;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String language;
}

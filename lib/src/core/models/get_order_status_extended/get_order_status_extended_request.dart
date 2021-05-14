import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_order_status_extended_request.g.dart';

/// {@template get_order_status_extended_request}
/// Расширенный запрос состояния заказа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetOrderStatusExtendedRequest extends AcquiringRequest {
  /// {@macro get_order_status_extended_request}
  GetOrderStatusExtendedRequest({
    this.orderId,
    this.orderNumber,
    this.language,
  });

  /// {@macro fromJson}
  factory GetOrderStatusExtendedRequest.fromJson(Map<String, dynamic> json) =>
      _$GetOrderStatusExtendedRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getOrderStatusExtended;

  @override
  Map<String, dynamic> toJson() => _$GetOrderStatusExtendedRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderId: orderId,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.language: language,
      };

  @override
  GetOrderStatusExtendedRequest copyWith({
    String? orderId,
    String? orderNumber,
    String? language,
  }) {
    return GetOrderStatusExtendedRequest(
      orderId: orderId ?? this.orderId,
      orderNumber: orderNumber ?? this.orderNumber,
      language: language ?? this.language,
    );
  }

  @override
  void validate() {
    assert(orderId != null || orderNumber != null);
  }

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  /// Отсутствует если регистрация заказа на удалась по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String? orderNumber;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;
}

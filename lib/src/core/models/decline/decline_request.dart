import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'decline_request.g.dart';

/// {@template decline_request}
/// Запрос отмены неоплаченного заказа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class DeclineRequest extends AcquiringRequest {
  /// {@macro decline_request}
  DeclineRequest({
    required this.merchantLogin,
    this.language,
    this.orderId,
    this.orderNumber,
  });

  /// {@macro fromJson}
  factory DeclineRequest.fromJson(Map<String, dynamic> json) =>
      _$DeclineRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.decline;

  @override
  Map<String, dynamic> toJson() => _$DeclineRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.merchantLogin: merchantLogin,
        JsonKeys.language: language,
        JsonKeys.orderId: orderId,
        JsonKeys.orderNumber: orderNumber,
      };

  @override
  DeclineRequest copyWith({
    String? merchantLogin,
    String? language,
    String? orderId,
    String? orderNumber,
  }) {
    return DeclineRequest(
      merchantLogin: merchantLogin ?? this.merchantLogin,
      language: language ?? this.language,
      orderId: orderId ?? this.orderId,
      orderNumber: orderNumber ?? this.orderNumber,
    );
  }

  @override
  void validate() {
    assert(orderId != null || orderNumber != null);
  }

  /// Укажите имя мерчанта, для которого вы хотите отклонить заказ.
  /// Это может быть как логин основного мерчанта, так и логин дочернего мерчанта.
  @JsonKey(name: JsonKeys.merchantLogin)
  final String merchantLogin;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  /// Отсутствует если регистрация заказа на удалась по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Номер заказа в системе магазина.
  @JsonKey(name: JsonKeys.orderNumber)
  final String? orderNumber;
}

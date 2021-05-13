import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_bindings_by_card_or_id_request.g.dart';

/// {@template get_bindings_by_card_or_id_request}
/// Запрос списка связок определённой банковской карты
///
/// При наличии соответствующих разрешений магазин может запросить список всех связок, относящихся к определённой банковской карте.
/// Сделать это можно по номеру карты или по известному идентификатору связки.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetBindingsByCardOrIdRequest extends AcquiringRequest {
  /// {@macro get_bindings_by_card_or_id_request}
  GetBindingsByCardOrIdRequest({
    this.pan,
    this.bindingId,
    this.showExpired,
  });

  /// {@macro fromJson}
  factory GetBindingsByCardOrIdRequest.fromJson(Map<String, dynamic> json) =>
      _$GetBindingsByCardOrIdRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getBindingsByCardOrId;

  @override
  Map<String, dynamic> toJson() => _$GetBindingsByCardOrIdRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.pan: pan,
        JsonKeys.bindingId: bindingId,
        JsonKeys.showExpired: showExpired,
      };

  @override
  GetBindingsByCardOrIdRequest copyWith({
    String pan,
    String bindingId,
    bool showExpired,
  }) {
    return GetBindingsByCardOrIdRequest(
      pan: pan ?? this.pan,
      bindingId: bindingId ?? this.bindingId,
      showExpired: showExpired ?? this.showExpired,
    );
  }

  @override
  void validate() {
    assert(pan != null || bindingId != null);
  }

  /// Маскированный номер карты, которая использовалась для оплаты.
  /// Указан только после оплаты заказа.
  /// В случае оплаты через Apple Pay в качестве номера карты используется DPAN:
  /// номер, привязанный к мобильному устройству покупателя и выполняющий функции номера платёжной карты в системе Apple Pay.
  @JsonKey(name: JsonKeys.pan)
  final String pan;

  /// Идентификатор созданной ранее связки.
  /// Может использоваться, только если у продавца есть разрешение на работу со связками.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;

  /// Параметр определяет необходимость отображать связки с истёкшим сроком действия карты.
  /// Возможные значения: `true`, `false`. По умолчанию параметр принимает значение `false`.
  @JsonKey(name: JsonKeys.showExpired)
  final bool showExpired;
}

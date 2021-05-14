import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';

part 'binding.g.dart';

/// {@template binding}
/// Информация о связке
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Binding extends BaseResponse {
  /// {@macro binding}
  Binding({
    this.bindingId,
    this.maskedPan,
    this.expiryDate,
    this.clientId,
  });

  /// {@macro fromJson}
  factory Binding.fromJson(Map<String, dynamic> json) =>
      _$BindingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BindingToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.bindingId: bindingId,
        JsonKeys.maskedPan: maskedPan,
        JsonKeys.expiryDate: expiryDate,
        JsonKeys.clientId: clientId,
      };

  /// Идентификатор созданной ранее связки.
  /// Может использоваться, только если у продавца есть разрешение на работу со связками.
  /// Если этот параметр передаётся в данном запросе, то это означает:
  /// 1. Данный заказ может быть оплачен только с помощью связки;
  /// 2. Плательщик будет перенаправлен на платёжную страницу, где требуется только ввод CVC.
  @JsonKey(name: JsonKeys.bindingId)
  final String? bindingId;

  /// Маскированный номер карты, которая использовалась для оплаты.
  @JsonKey(name: JsonKeys.maskedPan)
  final String? maskedPan;

  /// Срок истечения действия карты в формате ГГГГММ. Указан только после оплаты заказа.
  @JsonKey(name: JsonKeys.expiryDate)
  final int? expiryDate;

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функционала связок.
  /// Может присутствовать, если магазину разрешено создание связок.
  @JsonKey(name: JsonKeys.clientId)
  final String? clientId;
}

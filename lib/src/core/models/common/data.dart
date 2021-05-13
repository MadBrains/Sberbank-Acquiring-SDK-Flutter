import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';

part 'data.g.dart';

/// {@template data}
/// Дополнительные параметры
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Data extends BaseResponse {
  /// {@macro data}
  Data({
    this.orderId,
    this.bindingId,
    this.acsUrl,
    this.paReq,
    this.termUrl,
  });

  /// {@macro fromJson}
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.orderId: orderId,
        JsonKeys.value: bindingId,
      };

  /// Номер заказа в платежной системе
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Идентификатор созданной ранее связки.
  /// Может использоваться, только если у продавца есть разрешение на работу со связками.
  /// Если этот параметр передаётся в данном запросе, то это означает:
  /// 1. Данный заказ может быть оплачен только с помощью связки;
  /// 2. Плательщик будет перенаправлен на платёжную страницу, где требуется только ввод CVC.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;

  /// URL-адрес для перехода на сервер контроля доступа.
  @JsonKey(name: JsonKeys.acsUrl)
  final String acsUrl;

  /// Payment Authentication Request - запрос на аутентификацию платежа.
  @JsonKey(name: JsonKeys.paReq)
  final String paReq;

  /// URL-адрес для возврата с сервера контроля доступа.
  @JsonKey(name: JsonKeys.termUrl)
  final String termUrl;
}

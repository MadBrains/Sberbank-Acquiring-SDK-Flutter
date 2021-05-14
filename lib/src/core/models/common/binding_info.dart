import 'package:json_annotation/json_annotation.dart';

import '../base/base_response.dart';
import '../../../constants.dart';

part 'binding_info.g.dart';

/// {@template binding_info}
/// Информация о привязке
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BindingInfo extends BaseResponse {
  /// {@macro binding_info}
  BindingInfo({
    this.clientId,
    this.bindingId,
    this.authDateTime,
    this.terminalId,
  });

  /// {@macro fromJson}
  factory BindingInfo.fromJson(Map<String, dynamic> json) =>
      _$BindingInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BindingInfoToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.clientId: clientId,
        JsonKeys.bindingId: bindingId,
        JsonKeys.authDateTime: authDateTime,
        JsonKeys.terminalId: terminalId,
      };

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функционала связок.
  /// Может присутствовать, если магазину разрешено создание связок.
  @JsonKey(name: JsonKeys.clientId)
  final String? clientId;

  /// Идентификатор связки, созданной ранее.
  @JsonKey(name: JsonKeys.bindingId)
  final String? bindingId;

  /// Дата и время авторизации в формате UNIX-времени (POSIX-времени).
  @JsonKey(name: JsonKeys.authDateTime)
  final String? authDateTime;

  /// Идентификатор терминала в процессинге, через который осуществлялась оплата.
  @JsonKey(name: JsonKeys.terminalId)
  final String? terminalId;
}

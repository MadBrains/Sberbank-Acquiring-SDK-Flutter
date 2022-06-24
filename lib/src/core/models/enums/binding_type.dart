import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template binding_type}
/// Тип связоки
/// {@endtemplate}
enum BindingType {
  /// обычная связка для платежей вне определенного платежного графика или расписания
  @JsonValue(JsonValues.c)
  c,

  /// связка для платежей в рассрочку
  @JsonValue(JsonValues.i)
  i,

  /// связка для рекуррентных платежей
  @JsonValue(JsonValues.r)
  r,

  /// связка используется для хранения PAN получателя в P2P операциях
  @JsonValue(JsonValues.rc)
  rc,
}

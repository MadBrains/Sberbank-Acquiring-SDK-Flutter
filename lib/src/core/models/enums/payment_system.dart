import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template payment_system}
/// Наименование платёжной системы.
/// {@endtemplate}
enum PaymentSystem {
  /// VISA
  @JsonValue(JsonValues.visa)
  visa,

  /// MASTERCARD
  @JsonValue(JsonValues.mastercard)
  mastercard,

  /// AMEX
  @JsonValue(JsonValues.amex)
  amex,

  /// JCB
  @JsonValue(JsonValues.jcb)
  jcb,

  /// CUP
  @JsonValue(JsonValues.cup)
  cup,

  /// MIR
  @JsonValue(JsonValues.mir)
  mir,
}

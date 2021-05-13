import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template payment_state}
/// Состояние заказа
/// {@endtemplate}
enum PaymentState {
  /// заказ создан
  @JsonValue(JsonValues.created)
  created,

  /// заказ подтверждён
  @JsonValue(JsonValues.approved)
  approved,

  /// заказ завершён
  @JsonValue(JsonValues.deposited)
  deposited,

  /// заказ отклонён
  @JsonValue(JsonValues.declined)
  declined,

  /// заказ отменён
  @JsonValue(JsonValues.reversed)
  reversed,

  /// произведён возврат средств по заказу
  @JsonValue(JsonValues.refunded)
  refunded,
}

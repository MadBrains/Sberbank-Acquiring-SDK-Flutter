import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template receipt_status}
/// Состояние чека
/// {@endtemplate}
enum ReceiptStatus {
  /// отправлен платёж
  @JsonValue(JsonValues.paymentSent)
  paymentSent,

  /// доставлен платёж
  @JsonValue(JsonValues.paymentDelivered)
  paymentDelivered,

  /// ошибка платежа
  @JsonValue(JsonValues.paymentError)
  paymentError,

  /// отправлен возврат
  @JsonValue(JsonValues.refundSent)
  refundSent,

  /// доставлен возврат
  @JsonValue(JsonValues.refundDelivered)
  refundDelivered,

  /// ошибка возврата
  @JsonValue(JsonValues.refundError)
  refundError,
}

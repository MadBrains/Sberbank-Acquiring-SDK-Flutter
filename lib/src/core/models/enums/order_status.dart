import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template order_status}
/// Cостояние заказа в платёжной системе
/// {@endtemplate}
enum OrderStatus {
  /// заказ зарегистрирован, но не оплачен
  @JsonValue(JsonValues.registeredNotPaid)
  registeredNotPaid,

  /// предавторизованная сумма удержана (для двухстадийных платежей);
  @JsonValue(JsonValues.preAuthorized)
  preAuthorized,

  /// проведена полная авторизация суммы заказа
  @JsonValue(JsonValues.fullAuthorization)
  fullAuthorization,

  /// авторизация отменена
  @JsonValue(JsonValues.authorizationCanceled)
  authorizationCanceled,

  /// по транзакции была проведена операция возврата
  @JsonValue(JsonValues.refaundTransactions)
  refaundTransactions,

  /// инициирована авторизация через сервер контроля доступа банка-эмитента
  @JsonValue(JsonValues.authorizationThroughIssuingBank)
  authorizationThroughIssuingBank,

  /// авторизация отклонена
  @JsonValue(JsonValues.authorizationDenied)
  authorizationDenied,
}

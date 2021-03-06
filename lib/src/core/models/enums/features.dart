import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template features}
/// Способы проведения платежа
/// {@endtemplate}
enum Features {
  /// Платёж проводится без проверки подлинности владельца карты (без CVC и 3D-Secure).
  /// Чтобы проводить подобные платежи и продавца должны быть соответствующие разрешения.
  @JsonValue(JsonValues.autoPayment)
  autoPayment,

  /// Если указать это значение после запроса на регистрацию заказа произойдёт верификация держателя карты без списания средств с его счёта,
  /// поэтому в запросе можно передавать нулевую сумму.
  /// Верификация позволяет убедиться, что карта находится в руках владельца, и впоследствии списывать с этой карты средства,
  /// не прибегая к проверке аутентификационных данных (CVC, 3D-Secure) при совершении последующих платежей.
  ///
  /// - Даже если сумма платежа будет передана в запросе, она не будет списана со счёта покупателя.
  /// - После успешной регистрации заказ сразу переводится в статус REVERSED (отменён).
  @JsonValue(JsonValues.verify)
  verify,

  /// Принудительное проведение платежа с использованием 3-D Secure.
  /// Если карта не поддерживает 3-D Secure, транзакция не пройдёт.
  @JsonValue(JsonValues.forceTDS)
  forceTDS,

  /// Принудительное проведение платежа через SSL (без использования 3-D Secure).
  @JsonValue(JsonValues.forceSSL)
  forceSSL,

  /// После проведения аутентификации с помощью 3-D Secure статус PaRes должен быть только Y, что гарантирует успешную аутентификацию пользователя.
  /// В противном случае транзакция не пройдёт.
  @JsonValue(JsonValues.forceFullTDS)
  forceFullTDS,
}

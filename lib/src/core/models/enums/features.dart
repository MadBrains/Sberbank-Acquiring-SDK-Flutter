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

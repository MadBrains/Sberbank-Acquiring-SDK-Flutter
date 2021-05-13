import 'package:meta/meta.dart';
import 'utils/logger.dart';

/// {@template sberbank_acquiring_config}
/// Класс позволяет конфигурировать SDK.
/// {@endtemplate}
class SberbankAcquiringConfig {
  /// {@macro sberbank_acquiring}
  ///
  /// [userName]:
  /// {@macro user_name}
  ///
  /// [password]:
  /// {@macro password}
  ///
  /// [debug]:
  /// {@macro debug}
  ///
  /// [logger]:
  /// {@macro logger}
  factory SberbankAcquiringConfig({
    @required String userName,
    @required String password,
    bool debug = true,
    BaseLogger logger = const Logger(),
  }) {
    assert(userName != null);
    assert(password != null);

    return SberbankAcquiringConfig._(
      userName: userName,
      password: password,
      debug: debug,
      logger: logger,
    );
  }

  /// {@macro sberbank_acquiring}
  ///
  /// [token]:
  /// {@macro token}
  ///
  /// [debug]:
  /// {@macro debug}
  ///
  /// [logger]:
  /// {@macro logger}
  factory SberbankAcquiringConfig.token({
    @required String token,
    bool debug = true,
    BaseLogger logger = const Logger(),
  }) {
    assert(token != null);

    return SberbankAcquiringConfig._(
      token: token,
      debug: debug,
      logger: logger,
    );
  }

  /// {@macro sberbank_acquiring}
  ///
  /// [proxyUrl]:
  /// {@macro proxyUrl}
  ///
  /// [debug]:
  /// {@macro debug}
  ///
  /// [logger]:
  /// {@macro logger}
  factory SberbankAcquiringConfig.proxy({
    @required String proxyUrl,
    bool debug = true,
    BaseLogger logger = const Logger(),
  }) {
    assert(proxyUrl != null);

    return SberbankAcquiringConfig._(
      proxyUrl: proxyUrl,
      debug: debug,
      logger: logger,
    );
  }

  SberbankAcquiringConfig._({
    this.userName,
    this.password,
    this.token,
    this.proxyUrl,
    this.debug,
    this.logger,
  });

  /// {@template user_name}
  /// Логин служебной учётной записи продавца.
  /// При передаче логина и пароля для аутентификации в платёжном шлюзе параметр token передавать не нужно.
  /// {@endtemplate}
  final String userName;

  /// {@template password}
  /// Пароль служебной учётной записи продавца.
  /// При передаче логина и пароля для аутентификации в платёжном шлюзе параметр token передавать не нужно.
  /// {@endtemplate}
  final String password;

  /// {@template token}
  /// Значение, которое используется для аутентификации продавца при отправке запросов в платёжный шлюз.
  /// При передаче этого параметра параметры userName и pаssword передавать не нужно.
  ///
  /// Чтобы получить открытый ключ, обратитесь в техническую поддержку.
  /// {@endtemplate}
  final String token;

  /// {@template proxyUrl}
  /// Все запросы будут идти не на `Sberbank Acquiring API`,
  /// а на ваш сервер (указанный в `proxyUrl`), который должен иметь `userName` и `password` или `token`,
  /// который в конечном счете будет формировать запросы на `Sberbank Acquiring API`.
  ///
  /// Если вы используете `proxyUrl` то `userName`, `password` и `token` не обязательные.
  ///
  /// В формате: `https://server.com/`
  /// {@endtemplate}
  final String proxyUrl;

  /// {@template debug}
  /// Параметр для работы с debug сервером
  /// {@endtemplate}
  final bool debug;

  /// {@template logger}
  /// Позволяет использовать свой логгер или заданный
  /// {@endtemplate}
  final BaseLogger logger;
}

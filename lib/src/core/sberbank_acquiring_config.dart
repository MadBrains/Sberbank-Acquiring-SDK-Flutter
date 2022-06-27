import 'models/base/base.dart';
import 'utils/logger.dart';

/// {@template proxy_mapping}
/// Функция позволяющая модифицировать запрос к proxy api.
/// Позволяет изменять путь и загаловок запроса.
/// {@endtemplate}
typedef ProxyMapping = ProxyRequest? Function(
  AcquiringRequest request,
  bool isDebugMode,
);

/// {@template sberbank_acquiring_config}
/// Класс позволяет конфигурировать SDK.
/// {@endtemplate}
abstract class SberbankAcquiringConfig {
  /// {@macro sberbank_acquiring}
  ///
  /// [userName]:
  /// {@macro user_name}
  ///
  /// [password]:
  /// {@macro password}
  ///
  /// [isDebugMode]:
  /// {@macro is_debug_mode}
  ///
  /// [logger]:
  /// {@macro logger}
  factory SberbankAcquiringConfig.credential({
    required String userName,
    required String password,
    bool isDebugMode,
    BaseLogger logger,
  }) = SberbankAcquiringConfigCredential;

  /// {@macro sberbank_acquiring}
  ///
  /// [token]:
  /// {@macro token}
  ///
  /// [isDebugMode]:
  /// {@macro is_debug_mode}
  ///
  /// [logger]:
  /// {@macro logger}
  factory SberbankAcquiringConfig.token({
    required String token,
    bool isDebugMode,
    BaseLogger logger,
  }) = SberbankAcquiringConfigToken;

  /// {@macro sberbank_acquiring}
  ///
  /// [proxyDomain]:
  /// {@macro proxy_domain}
  ///
  /// [proxyPath]:
  /// {@macro proxy_path}
  ///
  /// [mapping]:
  /// {@macro proxy_mapping}
  ///
  /// [globalHeaders]:
  /// {@macro global_headers}
  ///
  /// [isDebugMode]:
  /// {@macro is_debug_mode}
  ///
  /// [logger]:
  /// {@macro logger}
  factory SberbankAcquiringConfig.proxy({
    required String proxyDomain,
    String proxyPath,
    ProxyMapping? mapping,
    Map<String, String>? globalHeaders,
    bool isDebugMode,
    BaseLogger logger,
  }) = SberbankAcquiringConfigProxy;

  const SberbankAcquiringConfig._({
    this.isDebugMode = true,
    this.logger = const Logger(),
  });

  /// {@template is_debug_mode}
  /// Параметр для работы с debug сервером
  /// {@endtemplate}
  final bool isDebugMode;

  /// {@template logger}
  /// Позволяет использовать свой логгер или заданный
  /// {@endtemplate}
  final BaseLogger logger;
}

/// {@template sberbank_acquiring_config_credential}
///
/// {@macro sberbank_acquiring}
///
/// [userName]:
/// {@macro user_name}
///
/// [password]:
/// {@macro password}
///
/// [isDebugMode]:
/// {@macro is_debug_mode}
///
/// [logger]:
/// {@macro logger}
///
/// {@endtemplate}
class SberbankAcquiringConfigCredential extends SberbankAcquiringConfig {
  /// {@macro sberbank_acquiring_config_credential}
  const SberbankAcquiringConfigCredential({
    required this.userName,
    required this.password,
    bool isDebugMode = true,
    BaseLogger logger = const Logger(),
  }) : super._(isDebugMode: isDebugMode, logger: logger);

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
}

/// {@template sberbank_acquiring_config_token}
///
/// {@macro sberbank_acquiring}
///
/// [token]:
/// {@macro token}
///
/// [isDebugMode]:
/// {@macro is_debug_mode}
///
/// [logger]:
/// {@macro logger}
///
/// {@endtemplate}
class SberbankAcquiringConfigToken extends SberbankAcquiringConfig {
  /// {@macro sberbank_acquiring_config_token}
  const SberbankAcquiringConfigToken({
    required this.token,
    bool isDebugMode = true,
    BaseLogger logger = const Logger(),
  }) : super._(isDebugMode: isDebugMode, logger: logger);

  /// {@template token}
  /// Значение, которое используется для аутентификации продавца при отправке запросов в платёжный шлюз.
  /// При передаче этого параметра параметры userName и pаssword передавать не нужно.
  ///
  /// Чтобы получить открытый ключ, обратитесь в техническую поддержку.
  /// {@endtemplate}
  final String token;
}

/// {@template sberbank_acquiring_config_proxy}
///
/// {@macro sberbank_acquiring}
///
/// [proxyDomain]:
/// {@macro proxy_domain}
///
/// [proxyPath]:
/// {@macro proxy_path}
///
/// [mapping]:
/// {@macro proxy_mapping}
///
/// [globalHeaders]:
/// {@macro global_headers}
///
/// [isDebugMode]:
/// {@macro is_debug_mode}
///
/// [logger]:
/// {@macro logger}
///
/// {@endtemplate}
class SberbankAcquiringConfigProxy extends SberbankAcquiringConfig {
  /// {@macro sberbank_acquiring_config_proxy}
  const SberbankAcquiringConfigProxy({
    required this.proxyDomain,
    this.proxyPath = '/',
    this.mapping,
    this.globalHeaders,
    bool isDebugMode = true,
    BaseLogger logger = const Logger(),
  }) : super._(isDebugMode: isDebugMode, logger: logger);

  /// {@template proxy_domain}
  /// Все запросы будут идти не на `Sberbank Acquiring API`,
  /// а на ваш сервер (указанный в `proxyDomain`), который должен иметь `userName` и `password` или `token`,
  /// который в конечном счете будет формировать запросы на `Sberbank Acquiring API`.
  ///
  /// Если вы используете `proxyDomain` то `userName`, `password` и `token` не обязательные.
  ///
  /// В формате: `server.com`
  /// {@endtemplate}
  final String proxyDomain;

  /// {@template proxy_path}
  /// Путь до api, по умолчанию `/`
  /// {@endtemplate}
  final String proxyPath;

  /// {@macro proxy_mapping}
  final ProxyMapping? mapping;

  /// {@template global_headers}
  /// Общий заголовок для всех запросов к proxy api.
  /// Добавляются к основным заголовкам и предопределяют их.
  /// Заголовки из [ProxyMapping] добавляються к [globalHeaders] и предопределяют их.
  /// {@endtemplate}
  final Map<String, String>? globalHeaders;
}

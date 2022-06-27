import 'dart:developer' as dev;

/// {@template base_logger}
/// Интерфейс базового логгера
/// {@endtemplate}
abstract class BaseLogger {
  /// {@macro base_logger}
  const BaseLogger();

  /// Метод логирует сообщение
  void log({
    required String message,
    String name = '',
    Object? error,
    StackTrace? stackTrace,
  });
}

/// {@template logger}
/// Реализация простого логгера
/// {@endtemplate}
class Logger extends BaseLogger {
  /// {@macro logger}
  const Logger();

  @override
  void log({
    required String message,
    String name = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    dev.log(
      message,
      name: 'Sber|$name',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

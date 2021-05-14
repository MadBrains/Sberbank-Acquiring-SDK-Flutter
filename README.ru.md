<h1 align="center">Flutter Sberbank Acquiring SDK</h1>

<a href="https://madbrains.ru/"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/logo.png?alt=media" width="200" align="right" style="margin: 20px;"/></a>
 
Acquiring SDK позволяет интегрировать [Интернет-Эквайринг Sberbank][acquiring] в мобильные приложения для платформы iOS и Android. 

[Документация по доступным API][documentation].

## Возможности SDK

- Проведение платежей (в том числе рекуррентных);
- Проведение платежей через Apple Pay или Google Pay (в том числе рекуррентных);
- Связанные платежи;
- Интеграция с онлайн-кассами;

## Подключение
Для подключения добавьте в файл pubspec.yaml зависимости:
```yaml
dependencies:
  sberbank_acquiring: 1.0.0
```

## Подготовка к работе

Для начала работы с SDK вам понадобятся:
* **userName** - Логин служебной учётной записи продавца; 
* **password** - Пароль служебной учётной записи продавца;
* **token** – Значение, которое используется для аутентификации продавца при отправке запросов в платёжный шлюз. При передаче этого параметра параметры `userName` и `pаssword` передавать не нужно. Чтобы получить открытый ключ, обратитесь в техническую поддержку.

Данные выдаются в личном кабинете после подключения к [Интернет-Эквайрингу][acquiring].

SDK позволяет настроить режим работы (debug/prod), по умолчанию - режим debug.
Также SDK позволяет настраивать проксирование запросов, по умолчанию все запросы идут на сервера Sberbank.

Чтобы настроить режим работы, установите параметры:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig(
    userName: userName,
    password: password,
    debug: false,
  ),
);
```

Если вы хотите использовать `token`, то воспользуйтесь следующим конструктором:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig.token(
    token: token,
  ),
);
```

Если вы хотите использовать `proxy`, то воспользуйтесь следующим конструктором:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig.proxy(
    proxyUrl: 'https://server.com/',
  ),
);
```

## Пример работы

Пример работы SDK доступен в [Example][example]


[documentation]: https://securepayments.sberbank.ru/wiki/doku.php/integration:paymentpage:paymentpage_design
[acquiring]: https://securepayments.sberbank.ru/wiki/doku.php/main_page
[example]: https://github.com/MadBrains/Sberbank-Acquiring-SDK-Flutter/tree/main/example/
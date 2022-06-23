<h1 align="center">Flutter Sberbank Acquiring SDK</h1>

<a href="https://madbrains.ru/"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/logo.png?alt=media" width="200" align="right" style="margin: 20px;"/></a>

[Read this in Russian](README.ru.md)

Acquiring SDK allows you to integrate [Sberbank Internet Acquiring][acquiring] into mobile applications for iOS and Android platforms.

[Available API Documentation][documentation].

## SDK Features

- Making payments (including recurring payments);
- Making payments via Apple Pay or Google Pay (including recurring payments);
- Related payments;
- Integration with online checkouts;

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  sberbank_acquiring: <lastles>
```

## Before usage

To get started with the SDK, you'll need:
* **userName** - The login of the vendor's service account; 
* **password** - Password of the vendor account;
* **token** – The value that is used to authenticate the merchant when sending requests to the payment gateway. You do not need to pass the `userName` and `password` parameters when passing this parameter. To obtain a public key, contact technical support.

These values are issued in your personal account after connecting to [Sberbank Internet Acquiring][acquiring].

SDK allows you to configure operating mode (debug / prod), by default - debug.
The SDK also allows you to configure request proxying, by default all requests go to Sberbank servers.

To configure the operation mode, set the following parameters:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig(
    userName: userName,
    password: password,
    debug: false,
  ),
);
```

If you want to use `token`, use the following constructor:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig.token(
    token: token,
  ),
);
```

If you want to use a `proxy`, use the following constructor:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig.proxy(
    proxyUrl: 'https://server.com/',
  ),
);
```

## Example

The [Example][example] is in the corresponding folder


[documentation]: https://securepayments.sberbank.ru/wiki/doku.php/integration:api:rest:start
[acquiring]: https://securepayments.sberbank.ru/wiki/doku.php/main_page
[example]: https://github.com/MadBrains/Sberbank-Acquiring-SDK-Flutter/tree/main/example/
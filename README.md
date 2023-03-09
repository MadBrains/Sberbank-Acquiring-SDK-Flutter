
<a href="https://madbrains.ru/?utm_source=gthb"><img src="docs/banner.png"></a>
<img align="left" src="docs/sber_sdk.png" width="480" height="360" /></a>

<h1 align="center">Flutter Sberbank Acquiring SDK</h1>

[Read this in Russian](README.ru.md)

Acquiring SDK allows you to integrate [Sberbank Internet Acquiring][acquiring] into mobile applications for iOS and Android platforms.

[Available API Documentation][documentation].


<p><h4> We solve problems of brand presence on mobile devices, specializing in development of mobile applications and services in the b2c segment.</h4>
<a href="https://madbrains.ru/?utm_source=gthb">
<img src="docs/get_started_stroke.png" width="249" height="45"></a>
</p>

<p><h5>Subscribe for the latest updates:</h5>
<a href="https://github.com/MadBrains" >
<img src="docs/follow_us_stroke.png" width="138" height="24"></a></p>
</br>


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
  SberbankAcquiringConfig.credential(
    userName: userName,
    password: password,
    isDebugMode: false,
  ),
);
```

If you want to use `token`, use the following constructor:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig.token(
    token: token,
    isDebugMode: false,
  ),
);
```

If you want to use a `proxy`, use the following constructor:
```dart
final SberbankAcquiring acquiring = SberbankAcquiring(
  SberbankAcquiringConfig.proxy(
    proxyDomain: 'server.com',
    proxyPath: 'api/v1/',
    globalHeaders: <String, String>{'auth': 'test'},
    mapping: (AcquiringRequest request, bool isDebugMode) {
      if(request is RegisterRequest) return ProxyMapping(path: '/register');
      return;
    }
  ),
);
```

## Example

The [Example][example] is in the corresponding folder


[documentation]: https://securepayments.sberbank.ru/wiki/doku.php/integration:api:rest:start
[acquiring]: https://securepayments.sberbank.ru/wiki/doku.php/main_page
[example]: https://github.com/MadBrains/Sberbank-Acquiring-SDK-Flutter/tree/main/example/

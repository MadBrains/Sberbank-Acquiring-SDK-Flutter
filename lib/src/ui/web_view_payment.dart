import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// {@template on_finished}
/// Коллбэк при успешной оплате
/// {@endtemplate}
typedef OnFinished = void Function(String orderId);

/// {@template on_load}
/// Коллбэк при загрузки
/// {@endtemplate}
typedef OnLoad = void Function(bool isLoading);

/// {@template on_error}
/// Коллбэк при ошибки
/// {@endtemplate}
typedef OnError = void Function();

/// {@template web_view_payment}
/// WebView для оплаты транзакции и прохождения 3-D Secure
/// {@endtemplate}
class WebViewPayment extends StatefulWidget {
  /// {@macro web_view_payment}
  const WebViewPayment({
    Key key,
    @required this.formUrl,
    @required this.returnUrl,
    this.failUrl,
    this.onFinished,
    this.onLoad,
    this.onError,
    this.onWebViewCreated,
  }) : super(key: key);

  /// URL-адрес платёжной формы, на который нужно перенаправить браузер клиента.
  /// Не возвращается, если регистрация заказа не удалась по причине ошибки, детализированной в errorCode.
  /// Можно получить из `RegisterResponse` поле `failUrl`.
  final String formUrl;

  /// Адрес, на который требуется перенаправить пользователя в случае успешной оплаты.
  /// Можно получить из `RegisterRequest` поле `returnUrl`.
  final String returnUrl;

  /// Адрес, на который требуется перенаправить пользователя в случае неуспешной оплаты.
  /// Можно получить из `RegisterRequest` поле `failUrl`.
  final String failUrl;

  /// {@macro on_finished}
  final OnFinished onFinished;

  /// {@macro on_load}
  final OnLoad onLoad;

  /// {@macro on_error}
  final OnError onError;

  /// Контроллер для управления webview
  final WebViewCreatedCallback onWebViewCreated;

  @override
  _WebViewPaymentState createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  bool hasSent = false;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.formUrl,
      gestureNavigationEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: widget.onWebViewCreated,
      onPageStarted: (String url) {
        if (url == widget.formUrl) {
          widget.onLoad(true);
        }

        if (url.contains(widget.returnUrl)) {
          hasSent = true;
          widget.onFinished(getOrderId(url));
        }

        if (widget.failUrl != null && url.contains(widget.failUrl)) {
          hasSent = true;
          widget.onError();
        }
      },
      onPageFinished: (String url) async {
        if (url == widget.formUrl) {
          widget.onLoad(false);
        }

        if (!hasSent && url.contains(widget.returnUrl)) {
          widget.onFinished(getOrderId(url));
        }

        if (!hasSent &&
            (widget.failUrl != null && url.contains(widget.failUrl))) {
          widget.onError();
        }
      },
    );
  }

  String getOrderId(String url) {
    final Uri _url = Uri.tryParse(url);

    return _url.queryParameters['orderId'];
  }
}

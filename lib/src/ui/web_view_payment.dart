import 'package:flutter/widgets.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// {@template on_finished}
/// Коллбэк при успешной оплате
/// {@endtemplate}
typedef OnFinished = void Function(String? orderId);

/// {@template on_load}
/// Коллбэк при загрузке
/// {@endtemplate}
typedef OnLoad = void Function({required bool isLoading});

/// {@template on_error}
/// Коллбэк при ошибке
/// {@endtemplate}
typedef OnError = void Function();

/// {@template web_view_payment}
/// WebView для оплаты транзакции и прохождения 3-D Secure
/// {@endtemplate}
class WebViewPayment extends StatefulWidget {
  /// {@macro web_view_payment}
  const WebViewPayment({
    Key? key,
    required this.logger,
    required this.formUrl,
    required this.returnUrl,
    this.failUrl,
    this.onFinished,
    this.onLoad,
    this.onError,
  }) : super(key: key);

  /// {@macro sberbank_acquiring_config}
  final BaseLogger logger;

  /// URL-адрес платёжной формы, на который нужно перенаправить браузер клиента.
  /// Не возвращается, если регистрация заказа не удалась по причине ошибки, детализированной в errorCode.
  /// Можно получить из `RegisterResponse` поле `failUrl`.
  final String formUrl;

  /// Адрес, на который требуется перенаправить пользователя в случае успешной оплаты.
  /// Можно получить из `RegisterRequest` поле `returnUrl`.
  final String returnUrl;

  /// Адрес, на который требуется перенаправить пользователя в случае неуспешной оплаты.
  /// Можно получить из `RegisterRequest` поле `failUrl`.
  final String? failUrl;

  /// {@macro on_finished}
  final OnFinished? onFinished;

  /// {@macro on_load}
  final OnLoad? onLoad;

  /// {@macro on_error}
  final OnError? onError;

  @override
  _WebViewPaymentState createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  bool hasSent = false;

  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    final String? failUrl = widget.failUrl;

    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.formUrl))
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            widget.logger
                .log(name: 'WebViewPayment', message: 'onPageStarted: $url');

            if (url == widget.formUrl) {
              widget.onLoad?.call(isLoading: true);
            }

            if (url.contains(widget.returnUrl)) {
              hasSent = true;
              widget.onFinished?.call(getOrderId(url));
            }

            if (failUrl != null && url.contains(failUrl)) {
              hasSent = true;
              widget.onError?.call();
            }
          },
          onPageFinished: (String url) async {
            widget.logger
                .log(name: 'WebViewPayment', message: 'onPageFinished: $url');

            if (url == widget.formUrl) {
              widget.onLoad?.call(isLoading: false);
            }

            if (!hasSent && url.contains(widget.returnUrl)) {
              widget.onFinished?.call(getOrderId(url));
            }

            if (!hasSent && (failUrl != null && url.contains(failUrl))) {
              widget.onError?.call();
            }
          },
        ),
      );
  }

  String? getOrderId(String url) {
    final Uri? _url = Uri.tryParse(url);

    return _url?.queryParameters['orderId'];
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _webViewController,
    );
  }
}

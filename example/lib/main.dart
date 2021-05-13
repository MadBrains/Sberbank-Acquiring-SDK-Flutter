import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mad_pay/mad_pay.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<PaymentItem> items = <PaymentItem>[
    PaymentItem(name: 'T-Shirt', price: 2000),
    PaymentItem(name: 'Trousers', price: 1600),
  ];
  MadPay madPay = MadPay();
  SberbankAcquiring acquiring = SberbankAcquiring(
    SberbankAcquiringConfig(
      userName: '',
      password: '',
    ),
  );

  OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Status: $orderStatus'),
            ElevatedButton(
              onPressed: () async {
                await webviewPayment();
              },
              child: const Text('Webview Buy'),
            ),
            ElevatedButton(
              onPressed: () async {
                await tokenPayment();
              },
              child: const Text('Apple/Google Buy'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> webviewPayment() async {
    final RegisterResponse register = await acquiring.register(RegisterRequest(
      amount: 1000,
      returnUrl: 'https://test.ru/return.html',
      failUrl: 'https://test.ru/fail.html',
      orderNumber: 'test',
      pageView: 'MOBILE',
    ));

    if (!register.hasError) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Scaffold(
            body: WebViewPayment(
              formUrl: register.formUrl,
              returnUrl: 'https://test.ru/return.html',
              failUrl: 'https://test.ru/fail.html',
              onLoad: (bool v) {
                debugPrint('WebView load: $v');
              },
              onError: () {
                debugPrint('WebView Error');
              },
              onFinished: (String v) async {
                final GetOrderStatusExtendedResponse status =
                    await acquiring.getOrderStatusExtended(
                        GetOrderStatusExtendedRequest(orderId: v));

                orderStatus = status.orderStatus;
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      );
    }
  }

  Future<void> tokenPayment() async {
    if (await madPay.checkPayments()) {
      final String token = (await madPay.processingPayment(
        google: GoogleParameters(
          gatewayName: 'sberbank',
          gatewayMerchantId: 'example_id',
          merchantId: 'example_id',
        ),
        apple: AppleParameters(
          merchantIdentifier: 'example_id',
        ),
        currencyCode: 'RUB',
        countryCode: 'RU',
        paymentItems: items,
        paymentNetworks: <PaymentNetwork>[
          PaymentNetwork.mastercard,
          PaymentNetwork.visa,
        ],
      ))
          .token;

      String orderId = '';

      if (Platform.isIOS) {
        final ApplePayResponse applePay = await acquiring.applePay(
          ApplePayRequest(
            merchant: 'test',
            language: 'ru',
            paymentToken: token,
          ),
        );

        if (applePay.success) {
          orderId = applePay.data.orderId;
        }
      }

      if (Platform.isAndroid) {
        final GooglePayResponse googlePay = await acquiring.googlePay(
          GooglePayRequest(
            merchant: 'test',
            language: 'ru',
            amount: items
                .map((PaymentItem v) => v.price)
                .reduce((double i1, double i2) => i1 + i2)
                .toInt(),
            paymentToken: token,
            failUrl: 'https://test.ru/fail',
            returnUrl: 'https://test.ru/return',
          ),
        );

        if (googlePay.success) {
          orderId = googlePay.data.orderId;
        }
      }

      if (orderId.isNotEmpty) {
        final GetOrderStatusExtendedResponse status = await acquiring
            .getOrderStatusExtended(GetOrderStatusExtendedRequest(
          orderId: orderId,
          language: 'ru',
        ));

        orderStatus = status.orderStatus;
        setState(() {});
      }
    }
  }
}

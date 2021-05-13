import 'package:flutter_test/flutter_test.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';

import 'test_constant.dart';

void start() {
  register();
  register(preAuth: true);

  test('deposit', () async {
    final DepositResponse value = await acquiring.deposit(DepositRequest(
      amount: 100,
      orderId: orderId,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, DepositResponse);
  });

  test('reverse', () async {
    final ReverseResponse value = await acquiring.reverse(ReverseRequest(
      orderId: orderId,
      jsonParams: <String, dynamic>{'test': 1},
      language: 'ru',
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, ReverseResponse);
  });

  test('refund', () async {
    final RefundResponse value = await acquiring.refund(RefundRequest(
      orderId: orderId,
      amount: 100,
      jsonParams: <String, dynamic>{'test': 1},
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, RefundResponse);
  });

  test('getOrderStatusExtended', () async {
    final GetOrderStatusExtendedResponse value =
        await acquiring.getOrderStatusExtended(GetOrderStatusExtendedRequest(
      orderId: orderId,
      orderNumber: orderNumber,
      language: 'ru',
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, GetOrderStatusExtendedResponse);
  });

  test('verifyEnrollment', () async {
    final VerifyEnrollmentResponse value =
        await acquiring.verifyEnrollment(VerifyEnrollmentRequest(
      pan: pan,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, VerifyEnrollmentResponse);
  });

  test('decline', () async {
    final DeclineResponse value = await acquiring.decline(DeclineRequest(
      merchantLogin: 'test',
      orderId: orderId,
      orderNumber: orderNumber,
      language: 'ru',
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, DeclineResponse);
  });

  test('getReceiptStatus', () async {
    final GetReceiptStatusResponse value =
        await acquiring.getReceiptStatus(GetReceiptStatusRequest(
      orderId: orderId,
      language: 'ru',
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, GetReceiptStatusResponse);
  });

  test('bindCard', () async {
    final BindCardResponse value = await acquiring.bindCard(BindCardRequest(
      bindingId: bindingId,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, BindCardResponse);
  });

  test('getBindings', () async {
    final GetBindingsResponse value =
        await acquiring.getBindings(GetBindingsRequest(
      clientId: clientId,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, GetBindingsResponse);
  });

  test('getBindingsByCardOrId', () async {
    final GetBindingsByCardOrIdResponse value =
        await acquiring.getBindingsByCardOrId(GetBindingsByCardOrIdRequest(
      bindingId: bindingId,
      pan: pan,
      showExpired: true,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, GetBindingsByCardOrIdResponse);
  });

  test('extendBinding', () async {
    final ExtendBindingResponse value =
        await acquiring.extendBinding(ExtendBindingRequest(
      bindingId: bindingId,
      language: 'ru',
      newExpiry: 202808,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, ExtendBindingResponse);
  });
  test('unBindCard', () async {
    final UnBindCardResponse value =
        await acquiring.unBindCard(UnBindCardRequest(
      bindingId: bindingId,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, UnBindCardResponse);
  });
}

void register({bool preAuth = false}) {
  test('register, preAuth: $preAuth', () async {
    final RegisterResponse value = await acquiring.register(RegisterRequest(
      preAuth: preAuth,
      orderNumber: orderNumber,
      amount: 100,
      currency: 643,
      returnUrl: 'https://test.ru/return.html',
      failUrl: 'https://test.ru/fail.html',
      description: 'test request',
      language: 'RU',
      pageView: 'MOBILE',
      // clientId: clientId,
      // merchantLogin: 'test',
      // jsonParams: <String, dynamic>{},
      sessionTimeoutSecs: 180,
      // expirationDate: '',
      // bindingId: bindingId,
      features: Features.forceFullTDS,
      email: 'test@test.ru',
      phone: 88005553535,
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, RegisterResponse);
  });

  test('register app2app, preAuth: $preAuth', () async {
    final RegisterResponse value = await acquiring.register(RegisterRequest(
      preAuth: preAuth,
      orderNumber: orderNumber,
      amount: 100,
      currency: 643,
      returnUrl: 'https://test.ru/return.html',
      failUrl: 'https://test.ru/fail.html',
      description: 'test request',
      language: 'RU',
      pageView: 'MOBILE',
      // clientId: clientId,
      // merchantLogin: 'test',
      // jsonParams: <String, dynamic>{},
      sessionTimeoutSecs: 180,
      // expirationDate: '',
      // bindingId: bindingId,
      features: Features.forceFullTDS,
      email: 'test@test.ru',
      phone: 88005553535,
      app2app: AppToApp(
        app2app: true,
        osType: OSType.ios,
        deepLink: 'link',
      ),
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, RegisterResponse);
  });

  test('register back2app, preAuth: $preAuth', () async {
    final RegisterResponse value = await acquiring.register(RegisterRequest(
      preAuth: preAuth,
      orderNumber: orderNumber,
      amount: 100,
      currency: 643,
      returnUrl: 'https://test.ru/return.html',
      failUrl: 'https://test.ru/fail.html',
      description: 'test request',
      language: 'RU',
      pageView: 'MOBILE',
      // clientId: clientId,
      // merchantLogin: 'test',
      jsonParams: <String, dynamic>{'test': 1},
      sessionTimeoutSecs: 180,
      // expirationDate: '',
      // bindingId: bindingId,
      features: Features.forceFullTDS,
      email: 'test@test.ru',
      phone: 88005553535,
      back2app: BackToApp(back2app: true),
    ));

    expect(value.hasError, false);
    expect(value.runtimeType, RegisterResponse);
  });
}

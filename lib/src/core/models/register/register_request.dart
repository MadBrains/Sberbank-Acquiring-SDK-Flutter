import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';
import '../base/base_request.dart';
import '../common/billing_payer_data.dart';
import '../enums/features.dart';
import '../enums/os_type.dart';

part 'register_request.g.dart';

/// {@template register_request}
/// Запрос регистрации заказа
///
/// Запрос на регистрацию заказа с предавторизацией, выполняется посредством передачи параметра `preAuth`.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RegisterRequest extends AcquiringRequest {
  /// {@macro register_request}
  RegisterRequest({
    required this.orderNumber,
    required this.amount,
    required this.returnUrl,
    this.preAuth = false,
    this.currency,
    this.failUrl,
    this.dynamicCallbackUrl,
    this.description,
    this.language,
    this.feeInput,
    this.pageView,
    this.clientId,
    this.merchantLogin,
    Map<String, dynamic>? jsonParams,
    this.sessionTimeoutSecs,
    this.expirationDate,
    this.bindingId,
    this.features,
    this.email,
    this.phone,
    this.app2app,
    this.back2app,
    this.autocompletionDate,
    this.billingPayerData,
  }) : jsonParams = jsonParams ?? <String, dynamic>{} {
    final AppToApp? _app2app = app2app;
    if (_app2app != null) {
      this.jsonParams.addAll(_app2app.toJson());
    }

    final BackToApp? _back2app = back2app;
    if (_back2app != null) {
      this.jsonParams.addAll(_back2app.toJson());
    }
  }

  /// {@macro fromJson}
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  @override
  String get apiMethod =>
      preAuth == true ? ApiMethods.registerPreAuth : ApiMethods.register;

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.preAuth: preAuth,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.amount: amount,
        JsonKeys.currency: currency,
        JsonKeys.returnUrl: returnUrl,
        JsonKeys.failUrl: failUrl,
        JsonKeys.dynamicCallbackUrl: dynamicCallbackUrl,
        JsonKeys.description: description,
        JsonKeys.language: language,
        JsonKeys.feeInput: feeInput,
        JsonKeys.pageView: pageView,
        JsonKeys.clientId: clientId,
        JsonKeys.merchantLogin: merchantLogin,
        JsonKeys.jsonParams: jsonParams,
        JsonKeys.sessionTimeoutSecs: sessionTimeoutSecs,
        JsonKeys.expirationDate: expirationDate,
        JsonKeys.bindingId: bindingId,
        JsonKeys.features: features,
        JsonKeys.email: email,
        JsonKeys.phone: phone,
        JsonKeys.autocompletionDate: autocompletionDate,
        JsonKeys.billingPayerData: billingPayerData,
      };

  @override
  RegisterRequest copyWith({
    bool? preAuth,
    String? orderNumber,
    int? amount,
    int? currency,
    String? returnUrl,
    String? failUrl,
    String? dynamicCallbackUrl,
    String? description,
    String? language,
    int? feeInput,
    String? pageView,
    String? clientId,
    String? merchantLogin,
    Map<String, dynamic>? jsonParams,
    int? sessionTimeoutSecs,
    String? expirationDate,
    String? bindingId,
    Features? features,
    String? email,
    int? phone,
    AppToApp? app2app,
    BackToApp? back2app,
    String? autocompletionDate,
    BillingPayerData? billingPayerData,
  }) {
    return RegisterRequest(
      preAuth: preAuth ?? this.preAuth,
      orderNumber: orderNumber ?? this.orderNumber,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      returnUrl: returnUrl ?? this.returnUrl,
      failUrl: failUrl ?? this.failUrl,
      dynamicCallbackUrl: dynamicCallbackUrl ?? this.dynamicCallbackUrl,
      description: description ?? this.description,
      language: language ?? this.language,
      feeInput: feeInput ?? this.feeInput,
      pageView: pageView ?? this.pageView,
      clientId: clientId ?? this.clientId,
      merchantLogin: merchantLogin ?? this.merchantLogin,
      jsonParams: jsonParams ?? this.jsonParams,
      sessionTimeoutSecs: sessionTimeoutSecs ?? this.sessionTimeoutSecs,
      expirationDate: expirationDate ?? this.expirationDate,
      bindingId: bindingId ?? this.bindingId,
      features: features ?? this.features,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      app2app: app2app ?? this.app2app,
      back2app: back2app ?? this.back2app,
      autocompletionDate: autocompletionDate ?? this.autocompletionDate,
      billingPayerData: billingPayerData ?? this.billingPayerData,
    );
  }

  @override
  void validate() {
    assert(preAuth != null);
    app2app?.validate();
    back2app?.validate();
    assert((app2app?.app2app == true) ^ (back2app?.back2app == true));
  }

  static String _jsonParamsToString(Map<String, dynamic> jsonParams) {
    final StringBuffer temp = StringBuffer();

    if (jsonParams.isNotEmpty) {
      temp.write('{');

      for (int i = 0; i < jsonParams.length; i++) {
        final bool hasComma =
            jsonParams.keys.last != jsonParams.keys.toList()[i];
        temp.write(
          '"${jsonParams.keys.toList()[i]}":"${jsonParams.values.toList()[i]}"${hasComma ? "," : ""}',
        );
      }

      temp.write('}');
    }
    return temp.toString();
  }

  // Параметр, определяющий необходимость предварительной авторизации (блокирования средств на счёте клиента до их списания).
  /// Доступны следующие значения:
  /// - `true` (истина) - параметр включён, производится двухстадийная оплата, запрос идет на `registerPreAuth`;
  /// - `false` (ложь) - параметр выключен, производится одностадийная оплата (средства списываются сразу), запрос идет на `register`.
  ///
  /// Если параметр не указан в запросе, происходит одностадийная оплата.
  @JsonKey(ignore: true)
  final bool? preAuth;

  /// Номер (идентификатор) заказа в системе магазина, уникален для каждого магазина в пределах системы.
  /// Если номер заказа генерируется на стороне платёжного шлюза, этот параметр передавать необязательно.
  @JsonKey(name: JsonKeys.orderNumber)
  final String orderNumber;

  /// Сумма возврата в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Код валюты платежа ISO 4217. Если не указано, то используется значение по умолчанию.
  @JsonKey(name: JsonKeys.currency)
  final int? currency;

  /// Адрес, на который требуется перенаправить пользователя в случае успешной оплаты.
  /// Адрес должен быть указан полностью, включая используемый протокол (например, https://test.ru вместо test.ru).
  /// В противном случае пользователь будет перенаправлен по адресу следующего вида: http://<адрес_платёжного_шлюза>/<адрес_продавца>.
  @JsonKey(name: JsonKeys.returnUrl)
  final String returnUrl;

  /// Адрес, на который требуется перенаправить пользователя в случае неуспешной оплаты.
  /// Адрес должен быть указан полностью, включая используемый протокол (например, https://test.ru вместо test.ru).
  /// В противном случае пользователь будет перенаправлен по адресу следующего вида: http://<адрес_платёжного_шлюза>/<адрес_продавца>.
  @JsonKey(name: JsonKeys.failUrl)
  final String? failUrl;

  /// Параметр позволяет воспользоваться функциональность динамической отправки callback-уведомлений.
  /// В нем можно передать адрес, на который будут отправляться все «платежные» callback-уведомления, активированные для продавца.
  /// Под платежными понимаются callback-уведомления о следующих событиях: успешный холд, платеж отклонен по таймауту,  платеж cardpresent отклонен, успешное списание, возврат, отмена.
  /// При этом активированные для мерчанта callback-уведомления, не относящиеся к платежам (включение/выключение связки, создание связки), будут отправляться на статический адрес для callback-ов.
  ///
  /// Для использования функциональности динамической отправки callback-уведомлений необходимо,
  /// чтобы у мерчанта была выставлена соответствующая настройка: Тип callback-а: Динамический (CALLBACK_TYPE = DYNAMIC).
  ///
  /// Чтобы мерчант мог получать callback-уведомления, для него необходима активация пермиссии: Разрешено выполнять callback операции.
  @JsonKey(name: JsonKeys.dynamicCallbackUrl)
  final String? dynamicCallbackUrl;

  /// Описание заказа в свободной форме.
  ///
  /// Чтобы получить возможность отправлять это поле в процессинг, обратитесь в техническую поддержку.
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;

  /// Сумма комиссии в минимальных единицах валюты.
  ///
  /// Параметр передается только при включении соответствующей пермиссии.
  @JsonKey(name: JsonKeys.feeInput)
  final int? feeInput;

  /// По значению данного параметра определяется, какие страницы платёжного интерфейса должны загружаться для клиента. Возможны следующие значения.
  /// - DESKTOP – для загрузки страниц, вёрстка которых предназначена для отображения на экранах ПК (в архиве страниц платёжного интерфейса будет осуществляться поиск страниц с названиями payment_<locale>.html и errors_<locale>.html).
  /// - MOBILE – для загрузки страниц, вёрстка которых предназначена для отображения на экранах мобильных устройств (в архиве страниц платёжного интерфейса будет осуществляться поиск страниц с названиями mobile_payment_<locale>.html и mobile_errors_<locale>.html).
  /// - Если магазин создал страницы платёжного интерфейса, добавив в название файлов страниц произвольные префиксы, передайте значение нужного префикса в параметре pageView для загрузки соответствующей страницы. Например, при передаче значения iphone в архиве страниц платёжного интерфейса будет осуществляться поиск страниц с названиями iphone_payment_<locale>.html и iphone_error_<locale>.html.
  ///
  /// Где:
  /// locale – язык страницы в кодировке ISO 639-1. Например, ru для русского или en для английского.
  ///
  /// Если параметр отсутствует, либо не соответствует формату, то по умолчанию считается pageView=DESKTOP.
  @JsonKey(name: JsonKeys.pageView)
  final String? pageView;

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функционала связок.
  /// Может присутствовать, если магазину разрешено создание связок.
  ///
  /// Указание этого параметра при платежах по связке необходимо - в противном случае платёж будет неуспешен.
  @JsonKey(name: JsonKeys.clientId)
  final String? clientId;

  /// Чтобы зарегистрировать заказ от имени дочернего продавца, укажите его логин в этом параметре.
  @JsonKey(name: JsonKeys.merchantLogin)
  final String? merchantLogin;

  /// Дополнительные параметры запроса. Формат вида: {«Имя1»: «Значение1», «Имя2»: «Значение2»}.
  @JsonKey(name: JsonKeys.jsonParams, toJson: _jsonParamsToString)
  final Map<String, dynamic> jsonParams;

  /// Продолжительность жизни заказа в секундах.
  ///
  /// В случае если параметр не задан, будет использовано значение, указанное в настройках мерчанта или время по умолчанию (1200 секунд = 20 минут).
  ///
  /// Если в запросе присутствует параметр expirationDate, то значение параметра sessionTimeoutSecs не учитывается.
  @JsonKey(name: JsonKeys.sessionTimeoutSecs)
  final int? sessionTimeoutSecs;

  /// Дата и время окончания жизни заказа. Формат: yyyy-MM-ddTHH:mm:ss.
  ///
  /// Если этот параметр не передаётся в запросе, то для определения времени окончания жизни заказа используется sessionTimeoutSecs.
  @JsonKey(name: JsonKeys.expirationDate)
  final String? expirationDate;

  /// Идентификатор созданной ранее связки. Может использоваться, только если у продавца есть разрешение на работу со связками.
  /// Если этот параметр передаётся в данном запросе, то это означает:
  /// 1. Данный заказ может быть оплачен только с помощью связки;
  /// 2. Плательщик будет перенаправлен на платёжную страницу, где требуется только ввод CVC.
  @JsonKey(name: JsonKeys.bindingId)
  final String? bindingId;

  /// {@macro features}
  @JsonKey(name: JsonKeys.features)
  final Features? features;

  /// Адрес электронной почты покупателя.
  @JsonKey(name: JsonKeys.email)
  final String? email;

  /// Номер телефона клиента. Может быть следующего формата: `^((+7|7|8)?([0-9]){10})$`.
  ///
  /// Примеры:
  /// - +79000000000
  /// - 89000000000
  /// - 9000000000
  /// - 79000000000
  @JsonKey(name: JsonKeys.phone)
  final int? phone;

  /// {@macro app_to_app}
  @JsonKey(name: JsonKeys.app2app, ignore: true)
  final AppToApp? app2app;

  /// {@macro back_to_app}
  @JsonKey(name: JsonKeys.back2app, ignore: true)
  final BackToApp? back2app;

  /// Дата и время автозавершения двухстадийного платежа в следующем формате: `2017-12-29T13:02:51`
  ///
  /// Чтобы подключить эту функциональность, обратитесь в службу технической поддержки.
  @JsonKey(name: JsonKeys.autocompletionDate)
  final String? autocompletionDate;

  /// {@macro billing_payer_data}
  @JsonKey(name: JsonKeys.billingPayerData)
  final BillingPayerData? billingPayerData;
}

/// {@template app_to_app}
/// Способ оплаты по сценарию app2app.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class AppToApp extends BaseRequest {
  /// {@macro app_to_app}
  AppToApp({
    required this.app2app,
    required this.osType,
    required this.deepLink,
  });

  /// {@macro fromJson}
  factory AppToApp.fromJson(Map<String, dynamic> json) =>
      _$AppToAppFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppToAppToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{...super.equals};

  @override
  AppToApp copyWith({
    bool? app2app,
    OSType? osType,
    String? deepLink,
  }) {
    return AppToApp(
      app2app: app2app ?? this.app2app,
      osType: osType ?? this.osType,
      deepLink: deepLink ?? this.deepLink,
    );
  }

  @override
  void validate() {}

  /// Атрибут, указывающий на способ оплаты через приложение СБОЛ (app2app).
  ///
  /// Возможны следующие значения:
  /// - `true` (истина);
  /// - `false` (ложь).
  ///
  /// Для использования этого параметра у мерчанта должна быть включена соответствующая пермиссия.
  @JsonKey(name: JsonKeys.app2app)
  final bool app2app;

  /// {@macro os_type}
  ///
  /// Обязательно, только если `app2app=true`.
  @JsonKey(name: JsonKeys.osType)
  final OSType osType;

  /// Ссылка на приложение мерчанта для возврата с успешной оплатой.
  ///
  /// Обязательно, только если `app2app=true`.
  @JsonKey(name: JsonKeys.deepLink)
  final String deepLink;
}

/// {@template back_to_app}
/// Способ оплаты по сценарию back2app.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BackToApp extends BaseRequest {
  /// {@macro back_to_app}
  BackToApp({
    required this.back2app,
  });

  /// {@macro fromJson}
  factory BackToApp.fromJson(Map<String, dynamic> json) =>
      _$BackToAppFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BackToAppToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{...super.equals};

  @override
  BackToApp copyWith({
    bool? back2app,
  }) {
    return BackToApp(
      back2app: back2app ?? this.back2app,
    );
  }

  @override
  void validate() {}

  /// Атрибут, указывающий на способ оплаты по сценарию back2app
  @JsonKey(name: JsonKeys.back2app)
  final bool back2app;
}

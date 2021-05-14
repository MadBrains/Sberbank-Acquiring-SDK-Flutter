import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../base/base_response.dart';

part 'register_response.g.dart';

/// {@template register_response}
/// Ответ регистрации заказа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RegisterResponse extends AcquiringResponse {
  /// {@macro register_response}
  RegisterResponse({
    String? errorCode,
    String? errorMessage,
    this.orderId,
    this.formUrl,
    this.externalParams,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderId: orderId,
        JsonKeys.formUrl: formUrl,
        JsonKeys.externalParams: externalParams,
      };

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  /// Отсутствует если регистрация заказа на удалась по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// URL-адрес платёжной формы, на который нужно перенаправить браузер клиента.
  /// Не возвращается, если регистрация заказа не удалась по причине ошибки, детализированной в errorCode.
  /// Для перенаправления пользователя на страницу оплаты через Сбербанк Онлайн добавьте GET-параметр toWeb2App=true к адресу, который передаётся в параметре formUrl.
  ///
  /// Чтобы получить возможность принимать оплату этим способом, у вас должны быть соответствующие полномочия в системе.
  /// В случае сомнений обратитесь в техническую поддержку.
  @JsonKey(name: JsonKeys.formUrl)
  final String? formUrl;

  /// {@macro register_external_params}
  @JsonKey(name: JsonKeys.externalParams)
  final RegisterExternalParams? externalParams;
}

/// {@template register_external_params}
/// Внешние параметры для app2app и back2app
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RegisterExternalParams extends BaseResponse {
  /// {@macro register_external_params}
  RegisterExternalParams({
    this.sbolDeepLink,
    this.sbolBankInvoiceId,
    this.sbolInactive,
  });

  /// {@macro fromJson}
  factory RegisterExternalParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterExternalParamsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterExternalParamsToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.sbolDeepLink: sbolDeepLink,
        JsonKeys.sbolBankInvoiceId: sbolBankInvoiceId,
        JsonKeys.sbolInactive: sbolInactive,
      };

  /// Ссылка на приложение Банка для завершения оплаты.
  @JsonKey(name: JsonKeys.sbolDeepLink)
  final String? sbolDeepLink;

  /// Уникальный идентификатор заказа, сгенерированный Банком.
  @JsonKey(name: JsonKeys.sbolBankInvoiceId)
  final String? sbolBankInvoiceId;

  /// Атрибут, информирующий о проходящих регламентных работах:
  ///
  /// Значение `true` - если проводятся регламентные работы
  /// Значение `false` - если не проводятся регламентные работы
  @JsonKey(name: JsonKeys.sbolInactive)
  final bool? sbolInactive;
}

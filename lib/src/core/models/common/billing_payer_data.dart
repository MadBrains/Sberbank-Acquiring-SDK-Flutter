import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';

part 'billing_payer_data.g.dart';

/// {@template billing_payer_data}
/// Блок c регистрационными данными клиента (адрес, почтовый индекс), необходимыми для прохождения проверки адреса в рамках сервисов AVS/AVV.
///
/// Обязателен, если активна соответствующая пермиссия для мерчанта («Разрешено использование AVS/AVV»).
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BillingPayerData extends BaseResponse {
  /// {@macro billing_payer_data}
  BillingPayerData({
    this.billingCity,
    this.billingCountry,
    this.billingAddressLine1,
    this.billingAddressLine2,
    this.billingAddressLine3,
    this.billingPostalCode,
    this.billingState,
  });

  /// {@macro fromJson}
  factory BillingPayerData.fromJson(Map<String, dynamic> json) =>
      _$BillingPayerDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BillingPayerDataToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.billingCity: billingCity,
        JsonKeys.billingCountry: billingCountry,
        JsonKeys.billingAddressLine1: billingAddressLine1,
        JsonKeys.billingAddressLine2: billingAddressLine2,
        JsonKeys.billingAddressLine3: billingAddressLine3,
        JsonKeys.billingPostalCode: billingPostalCode,
        JsonKeys.billingState: billingState,
      };

  /// Город, зарегистрированный по конкретной карте у Банка Эмитента
  @JsonKey(name: JsonKeys.billingCity)
  final String? billingCity;

  /// Страна, зарегистрированный по конкретной карте у Банка Эмитента
  @JsonKey(name: JsonKeys.billingCountry)
  final String? billingCountry;

  /// Адрес, зарегистрированный по конкретной карте у Банка Эмитента
  ///
  /// Строка 1.
  ///
  /// Обязательно, если у Мерчанта активирована пермиссия «Разрешено использование AVS/AVV».
  @JsonKey(name: JsonKeys.billingAddressLine1)
  final String? billingAddressLine1;

  /// Адрес, зарегистрированный по конкретной карте у Банка Эмитента
  ///
  /// Строка 2.
  @JsonKey(name: JsonKeys.billingAddressLine2)
  final String? billingAddressLine2;

  /// Адрес, зарегистрированный по конкретной карте у Банка Эмитента
  ///
  /// Строка 3.
  @JsonKey(name: JsonKeys.billingAddressLine3)
  final String? billingAddressLine3;

  /// Почтовый индекс, зарегистрированный по конкретной карте у Банка Эмитента.
  ///
  /// Обязательно, если у Мерчанта активирована пермиссия «Разрешено использование AVS/AVV».
  @JsonKey(name: JsonKeys.billingPostalCode)
  final String? billingPostalCode;

  /// Штат, зарегистрированный по конкретной карте у Банка Эмитента (ISO 3166-2)
  @JsonKey(name: JsonKeys.billingState)
  final String? billingState;
}

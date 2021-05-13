import 'package:json_annotation/json_annotation.dart';

import '../base/base_response.dart';
import '../../../constants.dart';
import '../enums/payment_system.dart';

part 'card_auth_info.g.dart';

/// {@template card_auth_info}
/// Открытая информация о карте
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class CardAuthInfo extends BaseResponse {
  /// {@macro card_auth_info}
  CardAuthInfo({
    this.maskedPan,
    this.approvalCode,
    this.chargeback,
    this.paymentSystem,
    this.productCategory,
    this.product,
    this.expiration,
    this.cardholderName,
    this.secureAuthInfo,
    this.pan,
  });

  /// {@macro fromJson}
  factory CardAuthInfo.fromJson(Map<String, dynamic> json) =>
      _$CardAuthInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CardAuthInfoToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.maskedPan: maskedPan,
        JsonKeys.expiration: expiration,
        JsonKeys.cardholderName: cardholderName,
        JsonKeys.approvalCode: approvalCode,
        JsonKeys.chargeback: chargeback,
        JsonKeys.paymentSystem: paymentSystem,
        JsonKeys.secureAuthInfo: secureAuthInfo,
        JsonKeys.pan: pan,
        JsonKeys.productCategory: productCategory,
        JsonKeys.product: product,
      };

  /// Маскированный номер карты, которая использовалась для оплаты.
  @JsonKey(name: JsonKeys.maskedPan)
  final String maskedPan;

  /// Срок истечения действия карты в формате `ГГГГММ`.
  @JsonKey(name: JsonKeys.expiration)
  final String expiration;

  /// Имя держателя карты латиницей, если доступно.
  @JsonKey(name: JsonKeys.cardholderName)
  final String cardholderName;

  /// Код авторизации международной платёжной системы.
  @JsonKey(name: JsonKeys.approvalCode)
  final String approvalCode;

  /// Были ли средства принудительно возвращены покупателю банком.
  /// Возможны следующие значения:
  /// - true (истина) - средства были возвращены;
  /// - false (ложь) - средства не были возвращены.
  @JsonKey(name: JsonKeys.chargeback)
  final bool chargeback;

  /// {@macro payment_system}
  @JsonKey(name: JsonKeys.paymentSystem)
  final PaymentSystem paymentSystem;

  /// {@macro secure_auth_info}
  @JsonKey(name: JsonKeys.secureAuthInfo)
  final SecureAuthInfo secureAuthInfo;

  /// Маскированный номер карты, которая использовалась для оплаты.
  @JsonKey(name: JsonKeys.pan)
  final String pan;

  /// Дополнительные сведения о категории корпоративных карт.
  /// Эти сведения заполняются службой технической поддержки в консоли управления.
  /// Если такие сведения отсутствуют, возвращается пустое значение.
  /// Возможные значения: DEBIT, CREDIT, PREPAID, NON_MASTERCARD, CHARGE, DIFFERED_DEBIT.
  @JsonKey(name: JsonKeys.productCategory)
  final String productCategory;

  /// Дополнительные сведения о корпоративных картах.
  /// Эти сведения заполняются службой технической поддержки.
  /// Если такие сведения отсутствуют, возвращается пустое значение.
  @JsonKey(name: JsonKeys.product)
  final String product;
}

/// {@template secure_auth_info}
/// Информация о безопасности карты
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class SecureAuthInfo extends BaseResponse {
  /// {@macro secure_auth_info}
  SecureAuthInfo({
    this.eci,
    this.threeDsInfo,
  });

  /// {@macro fromJson}
  factory SecureAuthInfo.fromJson(Map<String, dynamic> json) =>
      _$SecureAuthInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecureAuthInfoToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.eci: eci,
        JsonKeys.threeDsInfo: threeDsInfo,
      };

  /// Электронный коммерческий индикатор.
  @JsonKey(name: JsonKeys.eci)
  final int eci;

  /// {@macro three_ds_info}
  @JsonKey(name: JsonKeys.threeDsInfo)
  final ThreeDsInfo threeDsInfo;
}

/// {@template three_ds_info}
/// Информация о 3DS
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ThreeDsInfo extends BaseResponse {
  /// {@macro three_ds_info}
  ThreeDsInfo({
    this.cavv,
    this.xid,
  });

  /// {@macro fromJson}
  factory ThreeDsInfo.fromJson(Map<String, dynamic> json) =>
      _$ThreeDsInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ThreeDsInfoToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.cavv: cavv,
        JsonKeys.xid: xid,
      };

  /// Значение проверки аутентификации владельца карты.
  /// Указано только после оплаты заказа и в случае соответствующего разрешения.
  @JsonKey(name: JsonKeys.cavv)
  final String cavv;

  /// Электронный коммерческий идентификатор транзакции.
  /// Указан только после оплаты заказа и в случае соответствующего разрешения.
  @JsonKey(name: JsonKeys.xid)
  final String xid;
}

import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template payment_way}
/// Способ совершения платежа (платёж в с вводом карточных данных, оплата по связке и т. п.).
/// {@endtemplate}
enum PaymentWay {
  /// оплата с вводом карточных данных
  @JsonValue(JsonValues.card)
  card,

  /// оплата связкой
  @JsonValue(JsonValues.cardBinding)
  cardBinding,

  /// оплата через колл-центр
  @JsonValue(JsonValues.cardMoto)
  cardMoto,

  /// оплата как cardPresent
  @JsonValue(JsonValues.cardPresent)
  cardPresent,

  /// оплата через Сбербанк Онлайн
  @JsonValue(JsonValues.sberSbol)
  sberSbol,

  /// оплата через China Union Pay
  @JsonValue(JsonValues.upop)
  upop,

  /// оплата через файл
  @JsonValue(JsonValues.fileBinding)
  fileBinding,

  /// оплата через смс
  @JsonValue(JsonValues.smsBinding)
  smsBinding,

  /// перевод с карты на карту
  @JsonValue(JsonValues.p2p)
  p2p,

  /// перевод связкой
  @JsonValue(JsonValues.p2pBinding)
  p2pBinding,

  /// оплата со счёта PayPal
  @JsonValue(JsonValues.paypal)
  paypal,

  /// оплата со счёта МТС
  @JsonValue(JsonValues.mts)
  mts,

  /// Apple Pay
  @JsonValue(JsonValues.applePay)
  applePay,

  /// оплата связкой Apple Pay
  @JsonValue(JsonValues.applePayBinding)
  applePayBinding,

  /// Android Pay
  @JsonValue(JsonValues.androidPay)
  androidPay,

  /// оплата связкой Android Pay
  @JsonValue(JsonValues.androidPayBinding)
  androidPayBinding,

  /// Google Pay нетокенизированная
  @JsonValue(JsonValues.googlePayCard)
  googlePayCard,

  /// оплата связкой с не токенизированной картой GooglePay
  @JsonValue(JsonValues.googlePayCardBinding)
  googlePayCardBinding,

  /// Google Pay токенизированная
  @JsonValue(JsonValues.googlePayTokenized)
  googlePayTokenized,

  /// оплата связкой с токенизированной картой GooglePay
  @JsonValue(JsonValues.googlePayTokenizedBinding)
  googlePayTokenizedBinding,

  /// Samsung Pay
  @JsonValue(JsonValues.samsungPay)
  samsungPay,

  /// оплата связкой Samsung Pay
  @JsonValue(JsonValues.samsungPayBinding)
  samsungPayBinding,

  /// оплата iPOS
  @JsonValue(JsonValues.iPOS)
  iPOS,

  /// оплата SberPay
  @JsonValue(JsonValues.sberPay)
  sberPay,

  /// оплата SberID
  @JsonValue(JsonValues.sberId)
  sberId,
}

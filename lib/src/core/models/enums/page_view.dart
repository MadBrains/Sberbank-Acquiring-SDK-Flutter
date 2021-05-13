import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template page_view}
/// По значению данного параметра определяется, какие страницы платёжного интерфейса должны загружаться для клиента.
/// Возможны следующие значения.
///
/// Если параметр отсутствует, либо не соответствует формату, то по умолчанию считается pageView=DESKTOP.
/// {@endtemplate}
enum PageView {
  /// Для загрузки страниц, вёрстка которых предназначена для отображения на экранах ПК
  /// (в архиве страниц платёжного интерфейса будет осуществляться поиск страниц с названиями payment_<locale>.html и errors_<locale>.html).
  @JsonValue(JsonValues.desktop)
  desktop,

  /// для загрузки страниц, вёрстка которых предназначена для отображения на экранах мобильных устройств
  /// (в архиве страниц платёжного интерфейса будет осуществляться поиск страниц с названиями mobile_payment_<locale>.html и mobile_errors_<locale>.html).
  @JsonValue(JsonValues.mobile)
  mobile,
}

/// PageView extension
extension PageViewX on PageView {
  /// Convert enum to String
  String atString() {
    switch (this) {
      case PageView.desktop:
        return JsonValues.desktop;
      case PageView.mobile:
      default:
        return JsonValues.mobile;
    }
  }
}

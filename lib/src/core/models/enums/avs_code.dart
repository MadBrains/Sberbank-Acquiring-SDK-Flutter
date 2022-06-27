import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template avs_code}
/// AVS Response Сode - код ответа AVS-проверки (проверка адреса и почтового индекса держателя карты).
/// {@endtemplate}
enum AvsCode {
  /// почтовый индекс и адрес совпадают
  @JsonValue(JsonValues.a)
  a,

  /// адрес совпадает, почтовый индекс не совпадает
  @JsonValue(JsonValues.b)
  b,

  /// почтовый индекс совпадает, адрес не совпадает
  @JsonValue(JsonValues.c)
  c,

  /// почтовый индекс и адрес не совпадают
  @JsonValue(JsonValues.d)
  d,

  /// проверка данных запрошена, но результат неуспешен
  @JsonValue(JsonValues.e)
  e,

  /// некорректный формат запроса AVS/AVV проверки
  @JsonValue(JsonValues.f)
  f,
}

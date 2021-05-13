import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';

/// {@template os_type}
/// Тип ОС.
/// {@endtemplate}
enum OSType {
  /// ios
  @JsonValue(JsonValues.ios)
  ios,

  /// android
  @JsonValue(JsonValues.android)
  android,
}

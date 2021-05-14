import 'package:json_annotation/json_annotation.dart';
import '../../../constants.dart';
import '../base/base_response.dart';

part 'attribute.g.dart';

/// {@template attribute}
/// Дополнительные параметры
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Attribute extends BaseResponse {
  /// {@macro attribute}
  Attribute({
    this.name,
    this.value,
  });

  /// {@macro fromJson}
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AttributeToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.name: name,
        JsonKeys.value: value,
      };

  /// Название дополнительного параметра.
  @JsonKey(name: JsonKeys.name)
  final String? name;

  /// Значение дополнительного параметра - до 1024 символов.
  @JsonKey(name: JsonKeys.value)
  final String? value;
}

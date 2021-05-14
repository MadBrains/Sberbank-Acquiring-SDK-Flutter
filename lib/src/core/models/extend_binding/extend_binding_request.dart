import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'extend_binding_request.g.dart';

/// {@template extend_binding_request}
/// Запрос изменения срока действия связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ExtendBindingRequest extends AcquiringRequest {
  /// {@macro extend_binding_request}
  ExtendBindingRequest({
    required this.bindingId,
    required this.newExpiry,
    this.language,
  });

  /// {@macro fromJson}
  factory ExtendBindingRequest.fromJson(Map<String, dynamic> json) =>
      _$ExtendBindingRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.extendBinding;

  @override
  Map<String, dynamic> toJson() => _$ExtendBindingRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };

  @override
  ExtendBindingRequest copyWith({
    String? bindingId,
    int? newExpiry,
    String? language,
  }) {
    return ExtendBindingRequest(
      bindingId: bindingId ?? this.bindingId,
      newExpiry: newExpiry ?? this.newExpiry,
      language: language ?? this.language,
    );
  }

  @override
  void validate() {}

  /// Идентификатор созданной ранее связки.
  /// Может использоваться, только если у продавца есть разрешение на работу со связками.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;

  /// Новая дата (год и месяц) окончания срока действия в формате `ГГГГДД`.
  @JsonKey(name: JsonKeys.newExpiry)
  final int newExpiry;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;
}

import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';
import '../enums/binding_type.dart';

part 'get_bindings_request.g.dart';

/// {@template get_bindings_request}
/// Запрос списка всех связок клиента
///
/// Для получения списка связок по идентификатору клиента
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetBindingsRequest extends AcquiringRequest {
  /// {@macro get_bindings_request}
  GetBindingsRequest({
    required this.clientId,
    required this.bindingType,
    this.bindingId,
    this.showExpired,
    this.language,
  });

  /// {@macro fromJson}
  factory GetBindingsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetBindingsRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getBindings;

  @override
  Map<String, dynamic> toJson() => _$GetBindingsRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.clientId: clientId,
        JsonKeys.bindingId: bindingId,
        JsonKeys.showExpired: showExpired,
        JsonKeys.bindingType: bindingType,
        JsonKeys.language: language,
      };

  @override
  GetBindingsRequest copyWith({
    String? clientId,
    String? bindingId,
    bool? showExpired,
    BindingType? bindingType,
    String? language,
  }) {
    return GetBindingsRequest(
      clientId: clientId ?? this.clientId,
      bindingId: bindingId ?? this.bindingId,
      showExpired: showExpired ?? this.showExpired,
      bindingType: bindingType ?? this.bindingType,
      language: language ?? this.language,
    );
  }

  @override
  void validate() {}

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функционала связок.
  /// Может присутствовать, если магазину разрешено создание связок.
  @JsonKey(name: JsonKeys.clientId)
  final String clientId;

  /// Идентификатор связки, созданной ранее.
  @JsonKey(name: JsonKeys.bindingId)
  final String? bindingId;

  /// Параметр определяет необходимость отображать связки с истёкшим сроком действия карты.
  /// Возможные значения: true, false.
  /// По умолчанию параметр принимает значение false.
  @JsonKey(name: JsonKeys.showExpired)
  final bool? showExpired;

  /// {@macro binding_type}
  @JsonKey(name: JsonKeys.bindingType)
  final BindingType bindingType;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;
}

/// {@template get_all_bindings_request}
/// Запрос списка всех связок клиента с дубликатами
///
/// Для получения списка всех связок клиента (как связок родителя, так и связок его дочерних мерчантов)
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetAllBindingsRequest extends GetBindingsRequest {
  /// {@macro get_all_bindings_request}
  GetAllBindingsRequest({
    required String clientId,
    required BindingType bindingType,
    String? bindingId,
    bool? showExpired,
    String? language,
  }) : super(
          clientId: clientId,
          bindingType: bindingType,
          bindingId: bindingId,
          showExpired: showExpired,
          language: language,
        );

  /// {@macro fromJson}
  factory GetAllBindingsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllBindingsRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getAllBindings;

  @override
  Map<String, dynamic> toJson() => _$GetAllBindingsRequestToJson(this);
}

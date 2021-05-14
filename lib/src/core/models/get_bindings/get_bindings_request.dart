import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_bindings_request.g.dart';

/// {@template get_bindings_request}
/// Запрос списка всех связок клиента
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetBindingsRequest extends AcquiringRequest {
  /// {@macro get_bindings_request}
  GetBindingsRequest({
    required this.clientId,
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
      };

  @override
  GetBindingsRequest copyWith({
    String? clientId,
  }) {
    return GetBindingsRequest(
      clientId: clientId ?? this.clientId,
    );
  }

  @override
  void validate() {}

  /// Номер (идентификатор) клиента в системе магазина.
  /// Используется для реализации функционала связок.
  /// Может присутствовать, если магазину разрешено создание связок.
  @JsonKey(name: JsonKeys.clientId)
  final String clientId;
}

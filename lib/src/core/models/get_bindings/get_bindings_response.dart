import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../common/binding.dart';

part 'get_bindings_response.g.dart';

/// {@template get_bindings_response}
/// Ответ списка всех связок клиента
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetBindingsResponse extends AcquiringResponse {
  /// {@macro get_bindings_response}
  GetBindingsResponse({
    String? errorCode,
    String? errorMessage,
    this.bindings,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory GetBindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBindingsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetBindingsResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.bindings: bindings,
      };

  /// Списк связок
  @JsonKey(name: JsonKeys.bindings)
  final List<Binding>? bindings;
}

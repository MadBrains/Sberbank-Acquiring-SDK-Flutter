import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';

part 'extend_binding_response.g.dart';

/// {@template extend_binding_response}
/// Ответ изменения срока действия связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ExtendBindingResponse extends AcquiringResponse {
  /// {@macro extend_binding_response}
  ExtendBindingResponse({
    String? errorCode,
    String? errorMessage,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory ExtendBindingResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtendBindingResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExtendBindingResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}

import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';

part 'bind_card_response.g.dart';

/// {@template bind_card_response}
/// Ответ активации связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BindCardResponse extends AcquiringResponse {
  /// {@macro bind_card_response}
  BindCardResponse({
    String? errorCode,
    String? errorMessage,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory BindCardResponse.fromJson(Map<String, dynamic> json) =>
      _$BindCardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BindCardResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}

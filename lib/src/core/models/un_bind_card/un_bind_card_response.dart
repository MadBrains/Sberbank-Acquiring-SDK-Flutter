import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';

part 'un_bind_card_response.g.dart';

/// {@template un_bind_card_response}
/// Ответ деактивации связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class UnBindCardResponse extends AcquiringResponse {
  /// {@macro un_bind_card_response}
  UnBindCardResponse({
    String? errorCode,
    String? errorMessage,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory UnBindCardResponse.fromJson(Map<String, dynamic> json) =>
      _$UnBindCardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnBindCardResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}

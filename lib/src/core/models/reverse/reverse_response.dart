import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';

part 'reverse_response.g.dart';

/// {@template reverse_response}
/// Ответ отмены оплаты заказа.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ReverseResponse extends AcquiringResponse {
  /// {@macro reverse_response}
  ReverseResponse({
    String? errorCode,
    String? errorMessage,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory ReverseResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReverseResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}

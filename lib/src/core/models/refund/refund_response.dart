import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';

part 'refund_response.g.dart';

/// {@template refund_response}
/// Ответ возврата на полную сумму в деньгах
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RefundResponse extends AcquiringResponse {
  /// {@macro refund_response}
  RefundResponse({
    String? errorCode,
    String? errorMessage,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory RefundResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefundResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}

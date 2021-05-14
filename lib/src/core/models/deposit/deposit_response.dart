import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';

part 'deposit_response.g.dart';

/// {@template deposit_response}
/// Ответ завершения на полную сумму в деньгах
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class DepositResponse extends AcquiringResponse {
  /// {@macro deposit_response}
  DepositResponse({
    String? errorCode,
    String? errorMessage,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory DepositResponse.fromJson(Map<String, dynamic> json) =>
      _$DepositResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DepositResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}

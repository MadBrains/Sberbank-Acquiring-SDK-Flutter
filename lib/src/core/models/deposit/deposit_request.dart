import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'deposit_request.g.dart';

/// {@template deposit_request}
/// Запрос завершения на полную сумму в деньгах
///
/// Эту операцию можно осуществлять, если есть соответствующие права в системе.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class DepositRequest extends AcquiringRequest {
  /// {@macro deposit_request}
  DepositRequest({
    required this.amount,
    required this.orderId,
  });

  /// {@macro fromJson}
  factory DepositRequest.fromJson(Map<String, dynamic> json) =>
      _$DepositRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.deposit;

  @override
  Map<String, dynamic> toJson() => _$DepositRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.amount: amount,
        JsonKeys.orderId: orderId,
      };

  @override
  DepositRequest copyWith({
    int? amount,
    String? orderId,
  }) {
    return DepositRequest(
      amount: amount ?? this.amount,
      orderId: orderId ?? this.orderId,
    );
  }

  @override
  void validate() {}

  /// Сумма платежа в копейках (или центах).
  ///
  /// Внимание!!! Если в этом параметре указать ноль, завершение произойдет на всю предавторизованную сумму.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  /// Отсутствует если регистрация заказа на удалась по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;
}

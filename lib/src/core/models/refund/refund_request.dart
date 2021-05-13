import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'refund_request.g.dart';

/// {@template refund_request}
/// Запрос возврата на полную сумму в деньгах
///
/// По этому запросу средства по указанному заказу будут возвращены плательщику.
/// Запрос закончится ошибкой в случае, если средства по этому заказу не были списаны.
/// Система позволяет возвращать средства более одного раза, но в общей сложности не более первоначальной суммы списания.
///
/// Для выполнения операции возврата необходимо наличие соответствующих права в системе.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RefundRequest extends AcquiringRequest {
  /// {@macro refund_request}
  RefundRequest({
    @required this.amount,
    @required this.orderId,
    this.jsonParams,
  });

  /// {@macro fromJson}
  factory RefundRequest.fromJson(Map<String, dynamic> json) =>
      _$RefundRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.refund;

  @override
  Map<String, dynamic> toJson() => _$RefundRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.amount: amount,
        JsonKeys.orderId: orderId,
        JsonKeys.jsonParams: jsonParams,
      };

  @override
  RefundRequest copyWith({
    int amount,
    String orderId,
    Map<String, dynamic> jsonParams,
  }) {
    return RefundRequest(
      amount: amount ?? this.amount,
      orderId: orderId ?? this.orderId,
      jsonParams: jsonParams ?? this.jsonParams,
    );
  }

  @override
  void validate() {
    assert(amount != null);
    assert(orderId != null);
  }

  /// Сумма платежа в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  /// Отсутствует если регистрация заказа на удалась по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Дополнительные параметры запроса. Формат вида: {«Имя1»: «Значение1», «Имя2»: «Значение2»}.
  @JsonKey(name: JsonKeys.jsonParams)
  final Map<String, dynamic> jsonParams;
}

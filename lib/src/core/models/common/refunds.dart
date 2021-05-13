import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';

part 'refunds.g.dart';

/// {@template refunds}
/// Информация по возвратам
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Refunds extends BaseResponse {
  /// {@macro refunds}
  Refunds({
    this.referenceNumber,
    this.actionCode,
    this.amount,
    this.date,
  });

  /// {@macro fromJson}
  factory Refunds.fromJson(Map<String, dynamic> json) =>
      _$RefundsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefundsToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.referenceNumber: referenceNumber,
        JsonKeys.actionCode: actionCode,
        JsonKeys.amount: amount,
        JsonKeys.date: date,
      };

  /// Ссылочный номер транзакции, присваиваемый платёжным шлюзом после её завершения.
  @JsonKey(name: JsonKeys.referenceNumber)
  final int referenceNumber;

  /// Код ответа процессинга
  @JsonKey(name: JsonKeys.actionCode)
  final int actionCode;

  /// Сумма возврата в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Дата регистрации заказа в формате UNIX-времени (POSIX-времени).
  @JsonKey(name: JsonKeys.date)
  final String date;
}

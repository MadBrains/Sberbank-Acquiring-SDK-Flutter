import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';
import 'attribute.dart';

part 'payer_data.g.dart';

/// {@template payer_data}
/// Информация о клиенте
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class PayerData extends BaseResponse {
  /// {@macro payer_data}
  PayerData({
    this.email,
    this.transactionAttributes,
  });

  /// {@macro fromJson}
  factory PayerData.fromJson(Map<String, dynamic> json) =>
      _$PayerDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PayerDataToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.bankName: email,
        JsonKeys.transactionAttributes: transactionAttributes,
      };

  /// Адрес электронной почты покупателя.
  @JsonKey(name: JsonKeys.email)
  final String email;

  /// Сведения о деталях заказа.
  @JsonKey(name: JsonKeys.transactionAttributes)
  final List<Attribute> transactionAttributes;
}

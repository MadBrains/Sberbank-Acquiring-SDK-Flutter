import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'bind_card_request.g.dart';

/// {@template bind_card_request}
/// Запрос активации связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BindCardRequest extends AcquiringRequest {
  /// {@macro bind_card_request}
  BindCardRequest({
    @required this.bindingId,
  });

  /// {@macro fromJson}
  factory BindCardRequest.fromJson(Map<String, dynamic> json) =>
      _$BindCardRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.bindCard;

  @override
  Map<String, dynamic> toJson() => _$BindCardRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.bindingId: bindingId,
      };

  @override
  BindCardRequest copyWith({
    String bindingId,
  }) {
    return BindCardRequest(
      bindingId: bindingId ?? this.bindingId,
    );
  }

  @override
  void validate() {
    assert(bindingId != null);
  }

  /// Идентификатор созданной ранее связки. Может использоваться, только если у продавца есть разрешение на работу со связками.
  /// Если этот параметр передаётся в данном запросе, то это означает:
  /// 1. Данный заказ может быть оплачен только с помощью связки;
  /// 2. Плательщик будет перенаправлен на платёжную страницу, где требуется только ввод CVC.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;
}

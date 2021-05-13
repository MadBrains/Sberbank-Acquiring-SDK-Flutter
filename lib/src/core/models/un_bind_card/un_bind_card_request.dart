import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'un_bind_card_request.g.dart';

/// {@template un_bind_card_request}
/// Запрос деактивации связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class UnBindCardRequest extends AcquiringRequest {
  /// {@macro un_bind_card_request}
  UnBindCardRequest({
    @required this.bindingId,
  });

  /// {@macro fromJson}
  factory UnBindCardRequest.fromJson(Map<String, dynamic> json) =>
      _$UnBindCardRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.unBindCard;

  @override
  Map<String, dynamic> toJson() => _$UnBindCardRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.bindingId: bindingId,
      };

  @override
  UnBindCardRequest copyWith({
    String bindingId,
  }) {
    return UnBindCardRequest(
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

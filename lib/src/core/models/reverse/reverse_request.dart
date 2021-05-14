import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'reverse_request.g.dart';

/// {@template reverse_request}
/// Запрос отмены оплаты заказа.
/// Функция отмены доступна в течение ограниченного времени после оплаты, точные сроки необходимо уточнять в «Сбербанке».
///
///
/// Операция отмены оплаты может быть совершена только один раз.
/// Если она закончится ошибкой, то повторная операция отмены платежа не пройдёт.
/// Эта функция доступна магазинам по согласованию с банком.
/// Для выполнения операции отмены продавец должен обладать соответствующими правами.
///
/// При проведении частичной отмены (отмены части оплаты) сумма частичной отмены передается в необязательном параметре `amount`.
/// Частичная отмена возможна при наличии у магазина соответствующего разрешения в системе.
/// Частичная отмена невозможна для заказов с фискализацией, корзиной и лоялти.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ReverseRequest extends AcquiringRequest {
  /// {@macro reverse_request}
  ReverseRequest({
    required this.orderId,
    this.jsonParams,
    this.language,
  });

  /// {@macro fromJson}
  factory ReverseRequest.fromJson(Map<String, dynamic> json) =>
      _$ReverseRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.reverse;

  @override
  Map<String, dynamic> toJson() => _$ReverseRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderId: orderId,
        JsonKeys.jsonParams: jsonParams,
        JsonKeys.language: language,
      };

  @override
  ReverseRequest copyWith({
    String? orderId,
    Map<String, dynamic>? jsonParams,
    String? language,
  }) {
    return ReverseRequest(
      orderId: orderId ?? this.orderId,
      jsonParams: jsonParams ?? this.jsonParams,
      language: language ?? this.language,
    );
  }

  @override
  void validate() {}

  /// Номер заказа в платежной системе. Уникален в пределах системы.
  /// Отсутствует если регистрация заказа на удалась по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Дополнительные параметры запроса. Формат вида: {«Имя1»: «Значение1», «Имя2»: «Значение2»}.
  @JsonKey(name: JsonKeys.jsonParams)
  final Map<String, dynamic>? jsonParams;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;
}

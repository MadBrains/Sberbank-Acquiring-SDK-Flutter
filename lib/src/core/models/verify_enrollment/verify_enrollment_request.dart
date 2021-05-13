import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'verify_enrollment_request.g.dart';

/// {@template verify_enrollment_request}
/// Запрос проверки вовлечённости карты в 3DS
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class VerifyEnrollmentRequest extends AcquiringRequest {
  /// {@macro verify_enrollment_request}
  VerifyEnrollmentRequest({
    @required this.pan,
  });

  /// {@macro fromJson}
  factory VerifyEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyEnrollmentRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.verifyEnrollment;

  @override
  Map<String, dynamic> toJson() => _$VerifyEnrollmentRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.pan: pan,
      };

  @override
  VerifyEnrollmentRequest copyWith({
    String pan,
  }) {
    return VerifyEnrollmentRequest(
      pan: pan ?? this.pan,
    );
  }

  @override
  void validate() {
    assert(pan != null);
  }

  /// Маскированный номер карты, которая использовалась для оплаты.
  /// Указан только после оплаты заказа.
  ///
  /// В случае оплаты через Apple Pay в качестве номера карты используется DPAN:
  /// номер, привязанный к мобильному устройству покупателя и выполняющий функции номера платёжной карты в системе Apple Pay.
  @JsonKey(name: JsonKeys.pan)
  final String pan;
}

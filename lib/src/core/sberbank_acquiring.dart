import 'package:sberbank_acquiring/src/core/utils/network_client.dart';

import 'models/models.dart';
import 'sberbank_acquiring_config.dart';

/// {@template sberbank_acquiring}
/// Класс позволяет осуществлять взаимодействие с `Sberbank Acquiring API`.
///
/// Методы осуществляют обращение к API
/// {@endtemplate}
class SberbankAcquiring {
  /// {@macro sberbank_acquiring}
  SberbankAcquiring(this.config) : _network = NetworkClient(config);

  /// {@macro sberbank_acquiring_config}
  final SberbankAcquiringConfig config;

  final NetworkClient _network;

  /// {@macro apple_pay_request}
  Future<ApplePayResponse> applePay(ApplePayRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ApplePayResponse.fromJson(json),
    );
  }

  /// {@macro apple_pay_recurrent_request}
  Future<ApplePayRecurrentResponse> applePayRecurrent(
    ApplePayRecurrentRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => ApplePayRecurrentResponse.fromJson(json),
    );
  }

  /// {@macro bind_card_request}
  Future<BindCardResponse> bindCard(BindCardRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => BindCardResponse.fromJson(json),
    );
  }

  /// {@macro decline_request}
  Future<DeclineResponse> decline(DeclineRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => DeclineResponse.fromJson(json),
    );
  }

  /// {@macro deposit_request}
  Future<DepositResponse> deposit(DepositRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => DepositResponse.fromJson(json),
    );
  }

  /// {@macro extend_binding_request}
  Future<ExtendBindingResponse> extendBinding(ExtendBindingRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ExtendBindingResponse.fromJson(json),
    );
  }

  /// {@macro get_bindings_request}
  Future<GetBindingsResponse> getBindings(GetBindingsRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetBindingsResponse.fromJson(json),
    );
  }

  /// {@macro get_bindings_by_card_or_id_request}
  Future<GetBindingsByCardOrIdResponse> getBindingsByCardOrId(
    GetBindingsByCardOrIdRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) =>
          GetBindingsByCardOrIdResponse.fromJson(json),
    );
  }

  /// {@macro get_order_status_extended_request}
  Future<GetOrderStatusExtendedResponse> getOrderStatusExtended(
    GetOrderStatusExtendedRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) =>
          GetOrderStatusExtendedResponse.fromJson(json),
    );
  }

  /// {@macro get_receipt_status_request}
  Future<GetReceiptStatusResponse> getReceiptStatus(
    GetReceiptStatusRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetReceiptStatusResponse.fromJson(json),
    );
  }

  /// {@macro google_pay_request}
  Future<GooglePayResponse> googlePay(GooglePayRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GooglePayResponse.fromJson(json),
    );
  }

  /// {@macro refund_request}
  Future<RefundResponse> refund(RefundRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => RefundResponse.fromJson(json),
    );
  }

  /// {@macro register_request}
  Future<RegisterResponse> register(RegisterRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => RegisterResponse.fromJson(json),
    );
  }

  /// {@macro reverse_request}
  Future<ReverseResponse> reverse(ReverseRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ReverseResponse.fromJson(json),
    );
  }

  /// {@macro un_bind_card_request}
  Future<UnBindCardResponse> unBindCard(UnBindCardRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => UnBindCardResponse.fromJson(json),
    );
  }

  /// {@macro verify_enrollment_request}
  Future<VerifyEnrollmentResponse> verifyEnrollment(
    VerifyEnrollmentRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => VerifyEnrollmentResponse.fromJson(json),
    );
  }
}

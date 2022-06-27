// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_pay_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplePayResponse _$ApplePayResponseFromJson(Map<String, dynamic> json) =>
    ApplePayResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ErrorInfo.fromJson(json['error'] as Map<String, dynamic>),
      orderStatus: json['orderStatus'] == null
          ? null
          : OrderStatusInfo.fromJson(
              json['orderStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplePayResponseToJson(ApplePayResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('success', instance.success);
  writeNotNull('data', instance.data);
  writeNotNull('error', instance.error);
  writeNotNull('orderStatus', instance.orderStatus);
  return val;
}

import 'package:json_annotation/json_annotation.dart';
import '../../../constants.dart';
import '../base/base_response.dart';

part 'bank_info.g.dart';

/// {@template bank_info}
/// Информация о банке-эмитента
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BankInfo extends BaseResponse {
  /// {@macro bank_info}
  BankInfo({
    this.bankName,
    this.bankCountryCode,
    this.bankCountryName,
  });

  /// {@macro fromJson}
  factory BankInfo.fromJson(Map<String, dynamic> json) =>
      _$BankInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BankInfoToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.bankName: bankName,
        JsonKeys.bankCountryCode: bankCountryCode,
        JsonKeys.bankCountryName: bankCountryName,
      };

  /// Наименование банка-эмитента.
  @JsonKey(name: JsonKeys.bankName)
  final String bankName;

  /// Код страны банка-эмитента.
  @JsonKey(name: JsonKeys.bankCountryCode)
  final String bankCountryCode;

  /// Наименование страны банка-эмитента на языке, переданном в параметре language в запросе,
  /// или на языке пользователя, вызвавшего метод, если язык в запросе не указан.
  @JsonKey(name: JsonKeys.bankCountryName)
  final String bankCountryName;
}

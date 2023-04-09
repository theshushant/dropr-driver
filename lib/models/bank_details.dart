import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetail {
  @JsonKey(name: 'ab_number')
  final String abNumber;
  @JsonKey(name: 'bsb_number')
  final String bsbNumber;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  @JsonKey(name: 'account_holder_name')
  final String accountHolderName;

  BankDetail({
    required this.abNumber,
    required this.accountHolderName,
    required this.accountNumber,
    required this.bsbNumber,
  });

  factory BankDetail.fromJson(Map<String, dynamic> json) =>
      _$BankDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) => BankDetail(
      abNumber: json['ab_number'] as String,
      accountHolderName: json['account_holder_name'] as String,
      accountNumber: json['account_number'] as String,
      bsbNumber: json['bsb_number'] as String,
    );

Map<String, dynamic> _$BankDetailToJson(BankDetail instance) =>
    <String, dynamic>{
      'ab_number': instance.abNumber,
      'bsb_number': instance.bsbNumber,
      'account_number': instance.accountNumber,
      'account_holder_name': instance.accountHolderName,
    };

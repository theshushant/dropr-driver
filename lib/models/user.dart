import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? name;
  final String? email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'user_address')
  final String? userAddress;
  @JsonKey(name: 'is_email_verified')
  final bool isEmailVerified;
  @JsonKey(name: 'is_phone_verified')
  final bool isPhoneVerified;
  @JsonKey(name: 'linked_payment_mode')
  final String? linkedPaymentMode;
  @JsonKey(name: 'saved_addresses')
  final String? savedAddresses;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  // String get fullName {
  //   return firstName + ' ' + lastName;
  // }

  User({
    this.phoneNumber,
    this.name,
    required this.id,
    this.email,
    required this.updatedAt,
    required this.createdAt,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.linkedPaymentMode,
    this.savedAddresses,
    this.userAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      phoneNumber: json['phone_number'] as String?,
      name: json['name'] as String,
      id: json['id'] as int,
      email: json['email'] as String?,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      isEmailVerified: json['is_email_verified'] as bool? ?? false,
      isPhoneVerified: json['is_phone_verified'] as bool? ?? false,
      linkedPaymentMode: json['linked_payment_mode'] as String?,
      savedAddresses: json['saved_addresses'] as String?,
      userAddress: json['user_address'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'user_address': instance.userAddress,
      'is_email_verified': instance.isEmailVerified,
      'is_phone_verified': instance.isPhoneVerified,
      'linked_payment_mode': instance.linkedPaymentMode,
      'saved_addresses': instance.savedAddresses,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

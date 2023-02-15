// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      dropAddress:
          DroprAddress.fromJson(json['dropAddress'] as Map<String, dynamic>),
      pickupAddress:
          DroprAddress.fromJson(json['pickupAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'pickupAddress': instance.pickupAddress,
      'dropAddress': instance.dropAddress,
    };

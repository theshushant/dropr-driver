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
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      category: json['category'] as String,
      deliveryInstructions: json['delivery_instructions'] as String?,
      distance: (json['distance'] as num).toDouble(),
      dropAddressId: json['drop_address_id'] as int,
      orderStatus: json['order_status'] as String,
      packageType: json['package_type'] as String,
      paymentStatus: json['payment_status'] as String,
      scheduledDeliveryDate: json['scheduled_delivery_date'] as String,
      timeSlot: json['time_slot'] as String,
      userId: json['user_id'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'category': instance.category,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'user_id': instance.userId,
      'package_type': instance.packageType,
      'delivery_instructions': instance.deliveryInstructions,
      'distance': instance.distance,
      'drop_address_id': instance.dropAddressId,
      'order_status': instance.orderStatus,
      'payment_status': instance.paymentStatus,
      'scheduled_delivery_date': instance.scheduledDeliveryDate,
      'time_slot': instance.timeSlot,
      'pickupAddress': instance.pickupAddress,
      'dropAddress': instance.dropAddress,
    };

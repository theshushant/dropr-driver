import 'package:dropr_driver/models/address.dart';
import 'package:dropr_driver/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int id;
  User user;
  String category;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'package_type')
  String packageType;
  @JsonKey(name: 'delivery_instructions')
  String? deliveryInstructions;
  double distance;
  @JsonKey(name: 'drop_address_id')
  int dropAddressId;
  @JsonKey(name: 'order_status')
  String orderStatus;
  @JsonKey(name: 'payment_status')
  String paymentStatus;
  @JsonKey(name: 'scheduled_delivery_date')
  String scheduledDeliveryDate;
  @JsonKey(name: 'time_slot')
  String timeSlot;

  DroprAddress pickupAddress;
  DroprAddress dropAddress;

  Order({
    required this.id,
    required this.user,
    required this.dropAddress,
    required this.pickupAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.deliveryInstructions,
    required this.distance,
    required this.dropAddressId,
    required this.orderStatus,
    required this.packageType,
    required this.paymentStatus,
    required this.scheduledDeliveryDate,
    required this.timeSlot,
    required this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

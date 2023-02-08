import 'package:dropr_driver/models/address.dart';
import 'package:dropr_driver/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int id;
  User user;
  DroprAddress pickupAddress;
  DroprAddress dropAddress;

  Order({
    required this.id,
    required this.user,
    required this.dropAddress,
    required this.pickupAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

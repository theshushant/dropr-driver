import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class DroprAddress {
  int id;
  @JsonKey(name: 'house_number')
  String houseNumber;
  @JsonKey(name: 'building_name')
  String buildingName;
  String landmark;
  @JsonKey(name: 'contact_name')
  String contactName;
  @JsonKey(name: 'contact_number')
  String contactNumber;
  @JsonKey(name: 'address_type')
  AddressType addressType;
  String longitude;
  String latitude;
  @JsonKey(name: 'related_user_id')
  int relatedUserId;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  String get address {
    return '$contactName \n $houseNumber $buildingName $landmark';
  }

  DroprAddress({
    this.addressType = AddressType.HOME,
    this.buildingName = '',
    this.contactName = '',
    this.contactNumber = '',
    this.houseNumber = '',
    this.landmark = '',
    this.latitude = '',
    this.longitude = '',
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.relatedUserId,
  });

  factory DroprAddress.fromJson(Map<String, dynamic> json) =>
      _$DroprAddressFromJson(json);

  Map<String, dynamic> toJson() => _$DroprAddressToJson(this);
}

enum AddressType { HOME, WORK, OTHER }

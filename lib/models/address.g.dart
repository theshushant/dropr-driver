// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DroprAddress _$DroprAddressFromJson(Map<String, dynamic> json) => DroprAddress(
      addressType:
          $enumDecodeNullable(_$AddressTypeEnumMap, json['address_type']) ??
              AddressType.HOME,
      buildingName: json['building_name'] as String? ?? '',
      contactName: json['contact_name'] as String? ?? '',
      contactNumber: json['contact_number'] as String? ?? '',
      houseNumber: json['house_number'] as String? ?? '',
      landmark: json['landmark'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      id: json['id'] as int,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      relatedUserId: json['related_user_id'] as int,
    );

Map<String, dynamic> _$DroprAddressToJson(DroprAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'house_number': instance.houseNumber,
      'building_name': instance.buildingName,
      'landmark': instance.landmark,
      'contact_name': instance.contactName,
      'contact_number': instance.contactNumber,
      'address_type': _$AddressTypeEnumMap[instance.addressType]!,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'related_user_id': instance.relatedUserId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$AddressTypeEnumMap = {
  AddressType.HOME: 'HOME',
  AddressType.WORK: 'WORK',
  AddressType.OTHER: 'OTHER',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDetail _$VehicleDetailFromJson(Map<String, dynamic> json) =>
    VehicleDetail(
      driverLicenseImages: (json['driver_license_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      driverLicenseNumber: json['driver_license_number'] as String,
      registrationCertificateImages:
          (json['registration_certificate_images'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      registrationCertificateNumber:
          json['registration_certificate_number'] as String,
      vehiclePlateImages: (json['vehicle_plate_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      vehiclePlateNumber: json['vehicle_plate_number'] as String,
    );

Map<String, dynamic> _$VehicleDetailToJson(VehicleDetail instance) =>
    <String, dynamic>{
      'vehicle_plate_images': instance.vehiclePlateImages,
      'vehicle_plate_number': instance.vehiclePlateNumber,
      'driver_license_images': instance.driverLicenseImages,
      'driver_license_number': instance.driverLicenseNumber,
      'registration_certificate_images': instance.registrationCertificateImages,
      'registration_certificate_number': instance.registrationCertificateNumber,
    };

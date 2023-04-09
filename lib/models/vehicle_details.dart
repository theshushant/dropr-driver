import 'package:json_annotation/json_annotation.dart';

part 'vehicle_details.g.dart';

@JsonSerializable()
class VehicleDetail {
  @JsonKey(name: 'vehicle_plate_images')
  final List<String> vehiclePlateImages;
  @JsonKey(name: 'vehicle_plate_number')
  final String vehiclePlateNumber;
  @JsonKey(name: 'driver_license_images')
  final List<String> driverLicenseImages;
  @JsonKey(name: 'driver_license_number')
  final String driverLicenseNumber;
  @JsonKey(name: 'registration_certificate_images')
  final List<String> registrationCertificateImages;
  @JsonKey(name: 'registration_certificate_number')
  final String registrationCertificateNumber;

  VehicleDetail({
    this.driverLicenseImages = const [],
    required this.driverLicenseNumber,
    this.registrationCertificateImages = const [],
    required this.registrationCertificateNumber,
    this.vehiclePlateImages = const [],
    required this.vehiclePlateNumber,
  });

  factory VehicleDetail.fromJson(Map<String, dynamic> json) =>
      _$VehicleDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDetailToJson(this);
}

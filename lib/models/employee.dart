import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final int id;
  final String name;
  final String? email;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  final String? gender;
  @JsonKey(name: 'permanent_address')
  final String? permanentAddress;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? role;
  final String? longitude;
  final String? latitude;
  @JsonKey(name: 'vehicle_details')
  final dynamic vehicleDetails;
  @JsonKey(name: 'bank_details')
  final dynamic bankDetails;
  @JsonKey(name: 'emergency_contact')
  final dynamic emergencyContact;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;

  // String get fullName {
  //   return firstName + ' ' + lastName;
  // }

  Employee({
    this.phoneNumber,
    required this.name,
    required this.id,
    this.email,
    required this.updatedAt,
    required this.createdAt,
    this.longitude,
    this.latitude,
    this.bankDetails,
    this.dateOfBirth,
    this.emergencyContact,
    this.gender,
    this.permanentAddress,
    this.role,
    this.vehicleDetails,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

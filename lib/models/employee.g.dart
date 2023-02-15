// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      phoneNumber: json['phone_number'] as String?,
      name: json['name'] as String,
      id: json['id'] as int,
      email: json['email'] as String?,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      bankDetails: json['bank_details'],
      dateOfBirth: json['date_of_birth'] as String?,
      emergencyContact: json['emergency_contact'],
      gender: json['gender'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      role: json['role'] as String?,
      vehicleDetails: json['vehicle_details'],
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'permanent_address': instance.permanentAddress,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'vehicle_details': instance.vehicleDetails,
      'bank_details': instance.bankDetails,
      'emergency_contact': instance.emergencyContact,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };

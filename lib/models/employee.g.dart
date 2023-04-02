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
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetail.fromJson(json['bank_details'] as Map<String, dynamic>),
      dateOfBirth: json['date_of_birth'] as String?,
      emergencyContact: json['emergency_contact'] == null
          ? null
          : EmergencyContact.fromJson(
              json['emergency_contact'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      role: json['role'] as String?,
      vehicleDetails: json['vehicle_details'] == null
          ? null
          : VehicleDetail.fromJson(
              json['vehicle_details'] as Map<String, dynamic>),
      averageRating: json['average_rating'],
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
      'average_rating': instance.averageRating,
    };

import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact.g.dart';

@JsonSerializable()
class EmergencyContact {
  final String name;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String email;
  final String relationship;

  EmergencyContact({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.relationship,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);
}

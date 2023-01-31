import 'package:dropr_driver/helpers/section_tile.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class SectionRow extends StatelessWidget {
  final Map<String, dynamic> map;

  const SectionRow({
    Key? key,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTile(
          title: StringValue.basicInformation,
          body: basicInformationBody,
        ),
        SectionTile(
          title: StringValue.currentAddress,
          body: currentAddressBody,
        ),
        SectionTile(
          title: StringValue.permanentAddress,
          body: permanentAddressBody,
        ),
        SectionTile(
          title: StringValue.contactInformation,
          body: contactInformationBody,
        ),
        SectionTile(
          title: StringValue.vehicleInformation,
          body: vehicleInformationBody,
        ),
        SectionTile(
          title: StringValue.bankInformation,
          body: bankInformationBody,
        ),
      ],
    );
  }

  Widget get bankInformationBody {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.bankAccountName,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      'SBI',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.bSBNumber,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      '124255555',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.accountNumber,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      '12111993',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget get basicInformationBody {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['name'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.gender,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['gender'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.dateOfBirth,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['date_of_birth'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget get contactInformationBody {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.email,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['emergency_contact']['email'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.emergencyContactPersonName,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['emergency_contact']['name'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.emergancyContact,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['emergency_contact']['phone_number'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.relationshipWithEmergancyContact,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['emergency_contact']['relationship'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget get permanentAddressBody {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.bankAccountName,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      'SBI',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget get currentAddressBody {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.bankAccountName,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      'SBI',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget get vehicleInformationBody {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.vehicleNumber,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['vehicle_details']['vehicle_plate_number'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.vehicleImage,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['vehicle_details']['vehicle_plate_images'][0],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.registration,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['vehicle_details']['registration_certificate_number'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.registrationImage,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['vehicle_details']['registration_certificate_images'][0],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.driverLicense,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['vehicle_details']['driver_license_number'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorValues.blackColor.withOpacity(0.5),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringValue.driverLicenseImage,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      map['vehicle_details']['driver_license_images'][0],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      StringValue.edit,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorValues.linkTextColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

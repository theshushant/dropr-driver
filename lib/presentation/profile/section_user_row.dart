import 'package:dropr_driver/helpers/section_tile.dart';
import 'package:dropr_driver/models/employee.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class SectionUserRow extends StatelessWidget {
  final Employee user;

  const SectionUserRow({
    Key? key,
    required this.user,
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
                      user.bankDetails.accountHolderName,
                      style: TextStyle(
                        fontSize: 16,
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
                      user.bankDetails.bsbNumber,
                      style: TextStyle(
                        fontSize: 16,
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
                      user.bankDetails.accountNumber,
                      style: TextStyle(
                        fontSize: 16,
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
                      user.name,
                      style: TextStyle(
                        fontSize: 16,
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
                      user.gender ?? "",
                      style: TextStyle(
                        fontSize: 16,
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
                      user.dateOfBirth ?? "",
                      style: TextStyle(
                        fontSize: 16,
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.emergencyContact.email,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.emergencyContact.name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.emergencyContact.phoneNumber,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                      user.emergencyContact.relationship,
                      style: TextStyle(
                        fontSize: 16,
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
                StringValue.permanentAddress,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.permanentAddress ?? "",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                StringValue.currentAddress,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.permanentAddress ?? "",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                user.vehicleDetails.driverLicenseNumber,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorValues.linkTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.vehicleDetails.driverLicenseImages.first,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.vehicleDetails.vehiclePlateImages.first,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.vehicleDetails.registrationCertificateNumber,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.vehicleDetails.registrationCertificateImages.first,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.vehicleDetails.driverLicenseNumber,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      user.vehicleDetails.driverLicenseImages.first,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
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

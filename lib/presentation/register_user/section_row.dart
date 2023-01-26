import 'package:dropr_driver/helpers/section_tile.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class SectionRow extends StatelessWidget {
  const SectionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTile(
          title: StringValue.basicInformation,
        ),
        SectionTile(
          title: StringValue.currentAddress,
        ),
        SectionTile(
          title: StringValue.permanentAddress,
        ),
        SectionTile(
          title: StringValue.contactInformation,
        ),
        SectionTile(
          title: StringValue.vehicleInformation,
        ),
        SectionTile(
          title: StringValue.bankInformation,
        ),
      ],
    );
  }
}

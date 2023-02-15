import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/medium_text.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  final String toAddress;
  final String? toAddressDescription;
  final String fromAddress;
  final String? fromAddressDescription;

  const LocationItem({
    Key? key,
    required this.toAddress,
    required this.fromAddress,
    this.fromAddressDescription,
    this.toAddressDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImageValues.locationHistory,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleDescription(
                from: 'Pick up Location',
                title: fromAddress,
                description: fromAddressDescription,
                context: context),
            _titleDescription(
                from: 'Drop off Location',
                title: toAddress,
                description: toAddressDescription,
                context: context),
          ],
        ),
      ],
    );
  }

  Widget _titleDescription(
      {required String from,
      required String title,
      String? description,
      required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(
        top: applyPaddingX(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(from, style: Theme.of(context).textTheme.labelMedium),
          MediumText(
            text: title,
          ),
          const SizedBox(
            height: 4,
          ),
          HelpText(
            text: description ?? '',
          ),
        ],
      ),
    );
  }
}

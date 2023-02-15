import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/super_text.dart';
import 'package:dropr_driver/presentation/training.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);
  static String routeName = 'SuccessPage';

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorValues.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: applyPaddingX(1)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(applyPaddingX(2)),
                    child: const SuperText(
                      text: StringValue.success,
                      color: ColorValues.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    ImageValues.successImage,
                    errorBuilder: (context, error, stackTrace) =>
                        const Placeholder(),
                  ),
                  Text(StringValue.successLine,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(applyPaddingX(2)),
                      child: CustomRoundedButton(
                        text: StringValue.startYourTraining,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            TrainingPage.routeName,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

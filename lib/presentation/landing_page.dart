import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/super_text.dart';
import 'package:dropr_driver/presentation/walk_through_page.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static String routeName = 'LandingPage';

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorValues.whiteColor,
        padding: EdgeInsets.symmetric(
          horizontal: applyPaddingX(2),
          vertical: applyPaddingX(6),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SuperText(
                text: StringValue.walkThroughTitle,
                color: ColorValues.headingColor,
                fontWeight: FontWeight.bold,
              ),
              const HelpText(
                text: StringValue.walkThroughDescription,
                color: ColorValues.headingColor,
              ),
              Image.asset(
                ImageValues.landing,
                errorBuilder: (context, error, stackTrace) =>
                    const Placeholder(),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: applyPaddingX(4),
                ),
                child: CustomRoundedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringValue.walkThroughButton,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        width: globalPadding,
                      ),
                      const Icon(
                        Icons.arrow_forward_sharp,
                        color: ColorValues.whiteColor,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      WalkThroughPage.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

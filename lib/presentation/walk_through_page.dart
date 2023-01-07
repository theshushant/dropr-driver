import 'dart:async';
import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_indicator.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/super_text.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/register_user.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class WalkThroughPage extends StatefulWidget {
  static const String routeName = 'WalkThroughPage';

  const WalkThroughPage({Key? key}) : super(key: key);

  @override
  State<WalkThroughPage> createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  late int statePresent;
  late Timer _timer;
  @override
  initState() {
    super.initState();
    statePresent = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      if (statePresent == 2) {
        statePresent = 0;
      } else {
        statePresent += 1;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: applyPaddingX(2),
          vertical: applyPaddingX(2),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 500,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: applyPaddingX(3),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: Image.asset(
                  getImage,
                  errorBuilder: (context, error, stackTrace) =>
                      const Placeholder(),
                  fit: BoxFit.cover,
                ),
              ),
              const SuperText(
                text: StringValue.walkThroughWelcome,
                color: ColorValues.headingColor,
                fontWeight: FontWeight.bold,
              ),
              const HelpText(
                text: StringValue.walkThroughWelcomeHelper,
                color: ColorValues.headingColor,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: applyPaddingX(4),
                    vertical: applyPaddingX(2),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: _container(),
                      ),
                      CustomRoundedButton(
                        onTap: () {
                          _timer.cancel();
                          Navigator.pushNamed(
                            context,
                            RegisterUser.routeName,
                          );
                        },
                        text: StringValue.login,
                      ),
                      SizedBox(
                        height: applyPaddingX(2),
                      ),
                      GestureDetector(
                        onTap: () {
                          _timer.cancel();
                        },
                        child: const HelpText(
                          text: StringValue.signuptext,
                          color: ColorValues.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get getImage {
    switch (statePresent) {
      case 0:
        return ImageValues.walkThroughWelcome;
      case 1:
        return ImageValues.walkThroughDelivery;
      default:
        return ImageValues.walkThroughSecure;
    }
  }

  Widget _container() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DroprIndicator(
              onSelect: () {
                if (statePresent != 0) {
                  setState(() {
                    statePresent = 0;
                  });
                }
              },
              isSelected: statePresent == 0,
            ),
            DroprIndicator(
              onSelect: () {
                if (statePresent != 1) {
                  setState(() {
                    statePresent = 1;
                  });
                }
              },
              isSelected: statePresent == 1,
            ),
            DroprIndicator(
              onSelect: () {
                if (statePresent != 2) {
                  setState(() {
                    statePresent = 2;
                  });
                }
              },
              isSelected: statePresent == 2,
            ),
          ],
        ),
      ],
    );
  }
}

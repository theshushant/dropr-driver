import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);
  static String routeName = 'TrainingPage';

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
//  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.all(
                applyPaddingX(1),
              ),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.all(
              applyPaddingX(2),
            ),
            child: Text(
              'Training',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          trailing: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.all(
                applyPaddingX(1),
              ),
              child: addSVGIcons(
                ImageValues.callCenterIcon,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: applyPaddingX(1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(applyPaddingX(2)),
                    child: addImageSVG(ImageValues.deliveryAddress)),
                trainingBox(
                    'About Dropr',
                    'Learn about the company, Loreum Ipseum is a dummy text that helps you with the content',
                    5,
                    2,
                    ImageValues.landing,
                    context),
                trainingBox(
                    'How to use the app',
                    'Learn about the company, Loreum Ipseum is a dummy text that helps you with the content',
                    5,
                    2,
                    ImageValues.landing,
                    context),
                trainingBox(
                    'Rules',
                    'Learn about the company, Loreum Ipseum is a dummy text that helps you with the content',
                    5,
                    2,
                    ImageValues.landing,
                    context),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(applyPaddingX(2)),
                    child: CustomRoundedButton(
                      text: StringValue.finishTraining,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          HomePage.routeName,
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
    );
  }
}

Widget trainingBox(String title, String description, double score, int time,
    String imagePath, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: applyPaddingX(1)),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration:
          const BoxDecoration(color: ColorValues.whiteColor, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
        ),
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            child: Image.asset(
              imagePath,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(title,
                      softWrap: true,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            overflow: TextOverflow.ellipsis,
                          )),
                  Icon(Icons.arrow_forward)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Test Score:2/5',
                      softWrap: true,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            overflow: TextOverflow.ellipsis,
                          )),
                  Text('2 mins read',
                      softWrap: true,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            overflow: TextOverflow.ellipsis,
                          )),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

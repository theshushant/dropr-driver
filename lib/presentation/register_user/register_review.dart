import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/presentation/register_user/section_row.dart';
import 'package:dropr_driver/presentation/success_page.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class RegisterReview extends StatelessWidget {
  static const String routeName = 'RegisterReview';

  const RegisterReview({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    print('here data is this '+data.toString());
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
          title: Text(
            StringValue.registerYourself,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: Container(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: applyPaddingX(1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientProgressBar(
                  percent: progressIndicatorValue(8),
                  gradient: const LinearGradient(
                    colors: [
                      ColorValues.progressIndicatorColor1,
                      ColorValues.progressIndicatorColor2,
                    ],
                  ),
                  backgroundColor: ColorValues.whiteColor,
                  height: progressBarHeight,
                ),
                Padding(
                  padding: EdgeInsets.all(applyPaddingX(2)),
                  child: Text(
                    StringValue.review,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SectionRow(
                  map: data,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      Flexible(
                        child: Text(
                          StringValue.declaration,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(applyPaddingX(2)),
                    child: CustomRoundedButton(
                      text: StringValue.next,
                      onTap: () {
                        UserStore store =
                            Provider.of<UserStore>(context, listen: false);
                        store.registerYourself(data);
                        when((p0) => !store.isLoading, () {
                          Navigator.pushNamed(
                            context,
                            SuccessPage.routeName,
                          );
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

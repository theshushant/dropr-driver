import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatelessWidget {
  static const String routeName = 'PaymentHistory';

  const PaymentHistory({Key? key}) : super(key: key);

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
          title: Text(
            StringValue.paymentHistory,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: Container(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: applyPaddingX(2),
              ),
              body,
              body,
              body,
            ],
          ),
        ),
      ),
    );
  }

  Widget get body {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: applyPaddingX(1),
        vertical: applyPaddingX(1),
      ),
      margin: EdgeInsets.symmetric(
        vertical: applyPaddingX(1),
      ),
      color: ColorValues.textFieldFillColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              HelpText(
                  text: "14/11/2022 - 20/11/2022",
                  color: ColorValues.blackColor),
              HelpText(
                text: "\$149",
                color: ColorValues.blackColor,
              ),
            ],
          ),
          SizedBox(
            height: applyPaddingX(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              HelpText(
                text: "This week Earning",
                color: ColorValues.blackColor,
                fontSize: 12,
              ),
              Icon(
                Icons.arrow_forward_outlined,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/medium_text.dart';
import 'package:dropr_driver/helpers/section_tile.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class PaymentHistoryTotalEarning extends StatefulWidget {
  static const String routeName = 'PaymentHistoryTotalEarning';

  const PaymentHistoryTotalEarning({Key? key}) : super(key: key);

  @override
  State<PaymentHistoryTotalEarning> createState() =>
      _PaymentHistoryTotalEarningState();
}

class _PaymentHistoryTotalEarningState
    extends State<PaymentHistoryTotalEarning> {
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
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    MediumText(
                      text: StringValue.totalEarning,
                    ),
                    HelpText(
                      text:
                          "{commission.createdAt} - {commission.settlementDate}",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: applyPaddingX(1),
                  vertical: applyPaddingX(1),
                ),
                child: Column(
                  children: [
                    SectionTile(
                      title: "18/11/2022",
                      trailingWidget: Text(
                        '\$ 125',
                        style: TextStyle(
                            fontSize: extraTextSize, color: ColorValues.successColor),
                      ),
                      body: Container(
                        child: Column(
                          children: [
                            Divider(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                          ],
                        ),
                      ),
                    ),
                    SectionTile(
                      title: "17/11/2022",
                      trailingWidget: Text(
                        '\$ 125',
                        style: TextStyle(
                            fontSize: extraTextSize, color: ColorValues.successColor),
                      ),
                      body: Container(
                        child: Column(
                          children: [
                            Divider(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                          ],
                        ),
                      ),
                    ),
                    SectionTile(
                      title: "15/11/2022",
                      trailingWidget: Text(
                        '\$ 125',
                        style: TextStyle(
                            fontSize: extraTextSize, color: ColorValues.successColor),
                      ),
                      body: Container(
                        child: Column(
                          children: [
                            Divider(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                          ],
                        ),
                      ),
                    ),
                    SectionTile(
                      title: "14/11/2022",
                      trailingWidget: Text(
                        '\$ -5',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: extraTextSize,
                        ),
                      ),
                      body: Container(
                        child: Column(
                          children: [
                            Divider(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                            getOrderPayments(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget getOrderPayments(){
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: applyPaddingX(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          HelpText(text: "Order ID 158740",color: ColorValues.primaryColor,),
          HelpText(text: "\$ 125 ",color: ColorValues.blackColor,),
        ],
      ),
    );

  }
}

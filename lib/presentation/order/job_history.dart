import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/order/order_screen.dart';
import 'package:dropr_driver/store/order_store.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class JobHistory extends StatefulWidget {
  static const String routeName = 'JobHistory';

  JobHistory({Key? key}) : super(key: key);

  @override
  State<JobHistory> createState() => _JobHistoryState();
}

class _JobHistoryState extends State<JobHistory> {
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
          "Job History",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: Container(),
      ),
      body: _tabSection(context),
    ));
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: ColorValues.whiteColor,
          child: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: ColorValues.disabledColor,
              tabs: const [
                Tab(
                  child: Text("Completed"),
                ),
                Tab(child: Text("Rejected")),
              ]),
        ),
        Flexible(
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: StoreObserver(
                  builder: (OrderStore store, BuildContext context) {
                    if (!store.fetchedOrdersOnce &&
                        store.orders.isEmpty &&
                        !store.loadingState) {
                      store.fetchOrders();
                    }
                    if (store.orders.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.2),
                          child: HelpText(
                            text: StringValue.noDataAvailable,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: store.orders.length,
                      physics: ScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 10,
                          color: ColorValues.whiteColor,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return orderBox(context, store.orders[index]);
                      },
                    );
                  },
                ),
              ),
              SingleChildScrollView(
                child: StoreObserver(
                  builder: (OrderStore store, BuildContext context) {
                    if (!store.fetchedOrdersOnce &&
                        store.orders.isEmpty &&
                        !store.loadingState) {
                      store.fetchOrders();
                    }
                    if (store.orders.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.2),
                          child: HelpText(
                            text: StringValue.noDataAvailable,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: store.orders.length,
                      physics: ScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 10,
                          color: ColorValues.whiteColor,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return orderBox(context, store.orders[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget orderBox(BuildContext context, Order order) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderScreen.routeName,
          arguments: ScreenArguments(
            genericId: order.id,
          ),
        );
      },
      child: Container(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID ${order.id}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorValues.blackColor),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
            Row(
              children: [
                addImageSVG(ImageValues.pickupDropoffLocation),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(order.pickupAddress.address.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: ColorValues.blackColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(order.dropAddress.address.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: ColorValues.blackColor)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.document_scanner_sharp,
                        color: ColorValues.primaryColor),
                    SizedBox(
                      width: 10,
                    ),
                    HelpText(
                        color: ColorValues.primaryColor,
                        fontSize: 14,
                        text: "order")
                  ],
                ),
                Text('\$129',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorValues.blackColor))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

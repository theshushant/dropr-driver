import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/presentation/order/order_location.dart';
import 'package:dropr_driver/store/order_store.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = 'OrderScreen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
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
                StringValue.order,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Container(),
            ),
            Expanded(
              child: _body,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _body {
    return Container(
      color: ColorValues.whiteColor,
      child: StoreObserver(
        builder: (OrderStore store, BuildContext context) {
          if (!store.loadingState &&
              !store.fetchedOrdersOnce &&
              store.orders.isEmpty) {
            store.fetchOrders();
          }
          if (store.loadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (store.fetchedOrdersOnce && store.orders.isEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: const [
                  OrderLocation(),
                  OrderLocation(
                    isTypePickUp: false,
                  ),
                ],
              ),
            );
          }
          List<Widget> widgets = [];
          store.orders.forEach((Order element) {
            widgets.add(
              Column(
                children: const [
                  OrderLocation(),
                  OrderLocation(
                    isTypePickUp: false,
                  ),
                ],
              )
            );
          });
          return Column(
            children: widgets,
          );
        },
      ),
    );
  }
}

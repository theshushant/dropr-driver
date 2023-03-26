import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/presentation/order/order_location.dart';
import 'package:dropr_driver/store/order_store.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = 'OrderScreen';
  final int id;

  const OrderScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

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
              child: _body(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget  _body(BuildContext context) {
    print("here id object"+id.toString());
    Order? order = Provider.of<OrderStore>(context,listen: false).orderById(id);
    if(order == null){
      return SizedBox();
    }
    return Column(
      children: [
        OrderLocation(
          order: order,
        ),
        OrderLocation(
          order: order,
          isTypePickUp: false,
        ),
      ],
    );
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
          List<Widget> widgets = [];
          store.orders.forEach((Order element) {
            widgets.add(Column(
              children: [
                OrderLocation(
                  order: element,
                ),
                OrderLocation(
                  order: element,
                  isTypePickUp: false,
                ),
              ],
            ));
          });
          return Column(
            children: widgets,
          );
        },
      ),
    );
  }
}

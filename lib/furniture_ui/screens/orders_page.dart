import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/utils/constants.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

import '../../furniture_ui/widgets/main_drawer.dart';
import '../../furniture_ui/widgets/order_item.dart';
import '../../providers/orders.dart' show Orders;

class OrdersPage extends StatelessWidget {
  static const routeName = '/orders';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Your Orders'),
      backgroundColor: kPrimaryColor,
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 95),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          FutureBuilder(
            future:
                Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
            builder: (context, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, ordersData, child) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: ordersData.orders.length,
                      itemBuilder: (ctx, index) => OrderItem(
                        ordersData.orders[index],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

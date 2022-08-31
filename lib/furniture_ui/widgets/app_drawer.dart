import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/screens/manage_categories_page.dart';
import 'package:furniture_shop/furniture_ui/screens/user_products_screen.dart';

import '../screens/orders_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Shop'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersPage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Categories'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ManageCategoriesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

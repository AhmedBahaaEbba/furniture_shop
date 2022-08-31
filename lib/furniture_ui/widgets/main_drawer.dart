import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/screens/about_us_page.dart';
import 'package:furniture_shop/furniture_ui/screens/cart_page.dart';
import 'package:furniture_shop/furniture_ui/screens/favorites_page.dart';
import 'package:furniture_shop/furniture_ui/screens/notification_page.dart';
import 'package:furniture_shop/furniture_ui/screens/orders_page.dart';
import 'package:furniture_shop/furniture_ui/screens/profile_page.dart';
import 'package:furniture_shop/furniture_ui/screens/settings_page.dart';

import '../utils/constants.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('User@example.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: ListTile(
              title: Text('Home page'),
              leading: Icon(
                Icons.home,
                color: kPrimaryColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
            },
            child: ListTile(
              title: Text('My account'),
              leading: Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(NotificationPage.routeName);
            },
            child: ListTile(
              title: Text('Notification'),
              leading: Icon(
                Icons.notifications_active,
                color: kPrimaryColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CartPage.routeName);
            },
            child: ListTile(
              title: Text('Shopping Cart'),
              leading: Icon(
                Icons.shopping_cart,
                color: kPrimaryColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersPage.routeName);
            },
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: kPrimaryColor,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Settings.routeName);
            },
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutUsPage.routeName);
            },
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help),
            ),
          ),
        ],
      ),
    );
  }
}

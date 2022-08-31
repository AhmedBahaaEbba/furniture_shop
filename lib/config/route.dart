import 'package:flutter/material.dart';

import 'file:///C:/Projects/furniture_shop/lib/furniture_ui/screens/DataSearch.dart';

import '../furniture_ui/home.dart';
import '../furniture_ui/screens/about_us_page.dart';
import '../furniture_ui/screens/cart_page.dart';
import '../furniture_ui/screens/cart_screen.dart';
import '../furniture_ui/screens/details_page.dart';
import '../furniture_ui/screens/edit_product_page.dart';
import '../furniture_ui/screens/favorites_page.dart';
import '../furniture_ui/screens/home_page.dart';
import '../furniture_ui/screens/manage_categories_page.dart';
import '../furniture_ui/screens/notification_page.dart';
import '../furniture_ui/screens/orders_page.dart';
import '../furniture_ui/screens/product_detail_screen.dart';
import '../furniture_ui/screens/profile_page.dart';
import '../furniture_ui/screens/settings_page.dart';
import '../furniture_ui/screens/user_products_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (ctx) => Home(),
      ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
      CartScreen.routeName: (ctx) => CartScreen(),
      OrdersPage.routeName: (ctx) => OrdersPage(),
      UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
      EditProductScreen.routeName: (ctx) => EditProductScreen(),
      DetailsScreen.routName: (ctx) => DetailsScreen(),
      CartPage.routeName: (ctx) => CartPage(),
      HomePage.routeName: (ctx) => HomePage(),
      ManageCategoriesScreen.routeName: (ctx) => ManageCategoriesScreen(),
      FavoritesPage.routeName: (ctx) => FavoritesPage(),
      Settings.routeName: (ctx) => Settings(),
      ProfilePage.routeName: (ctx) => ProfilePage(),
      AboutUsPage.routeName: (ctx) => AboutUsPage(),
      NotificationPage.routeName: (ctx) => NotificationPage(),
      Search.routeName: (ctx) => Search(),
    };
  }
}

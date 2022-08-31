import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/screens/cart_page.dart';
import 'package:furniture_shop/furniture_ui/widgets/details_screen_body.dart';

import '../utils/constants.dart';

class DetailsScreen extends StatelessWidget {
  static const routName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
        ],
      ),
      body: DetailsScreenBody(),
    );
  }
}

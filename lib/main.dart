import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_shop/providers/categories.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products.dart';
import 'config/route.dart';
import 'furniture_ui/utils/constants.dart';

void main() => runApp(FurnitureShop());

class FurnitureShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
      ],
      child: OKToast(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NewHouse',
          theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            primaryColor: kPrimaryColor,
            accentColor: kPrimaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Lato',
          ),
          routes: Routes.getRoute(),
        ),
      ),
    );
  }
}

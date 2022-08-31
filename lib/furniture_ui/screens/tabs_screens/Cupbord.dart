import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/utils/constants.dart';
import 'package:furniture_shop/furniture_ui/widgets/product_card.dart';
import 'package:furniture_shop/providers/products.dart';
import 'package:provider/provider.dart';

class Kitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kitchen = Provider.of<Products>(context).getOneCategory('Kitchen');
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              // Our background
              Container(
                margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: kitchen.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: kitchen[index],
                  child: ProductCard(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

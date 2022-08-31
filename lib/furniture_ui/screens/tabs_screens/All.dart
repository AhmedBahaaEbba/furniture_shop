import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/utils/constants.dart';
import 'package:furniture_shop/furniture_ui/widgets/products_list.dart';
import 'package:furniture_shop/providers/products.dart';
import 'package:provider/provider.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              FutureBuilder(
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ProductsList();
                  }
                },
                future: Provider.of<Products>(context, listen: false)
                    .fetchAndSetAllProducts(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_card.dart';
import '../../providers/products.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductCard(),
      ),
    );
  }
}

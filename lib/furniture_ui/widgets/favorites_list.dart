import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/widgets/product_card.dart';
import 'package:furniture_shop/providers/products.dart';
import 'package:provider/provider.dart';

class FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).favoritesItems;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductCard(),
      ),
    );
  }
}

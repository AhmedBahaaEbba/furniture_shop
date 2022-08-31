import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_drawer.dart';
import 'package:furniture_shop/providers/products.dart';
import 'package:provider/provider.dart';

import '../widgets/user_product_item.dart';
import 'edit_product_page.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          FlatButton(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, index) => UserProductItem(
              productsData.items[index].id,
              productsData.items[index].title,
              productsData.items[index].imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}

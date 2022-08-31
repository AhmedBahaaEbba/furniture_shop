import 'package:flutter/material.dart';
import 'package:furniture_shop/providers/cart.dart';
import 'package:furniture_shop/providers/products.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class BuyAndAddToCart extends StatefulWidget {
  final String productId;

  BuyAndAddToCart(this.productId);

  @override
  _BuyAndAddToCartState createState() => _BuyAndAddToCartState();
}

class _BuyAndAddToCartState extends State<BuyAndAddToCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final product =
        Provider.of<Products>(context).findProductById(widget.productId);
//    final product = Provider.of<Product>(context);
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding / 4,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: FlatButton(
              padding: EdgeInsets.all(8),
              onPressed: () {},
              child: Text('Buy Now!'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    product.toggleFavoriteStatus(product.id);
                  });
                },
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Theme.of(context).accentColor,
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cart.addItem(
                    product.id,
                    product.title,
                    product.imageUrl,
                    product.price,
                  );
                  showToast(
                    "The Item Added To Your Cart",
                    position: ToastPosition.center,
                    backgroundColor: kPrimaryColor,
                    dismissOtherToast: true,
                  );
                },
              ),
            ],
          ),
//          Expanded(
//            child: FlatButton.icon(
//              onPressed: () {},
//              icon: Icon(
//                Icons.add_shopping_cart,
//                color: Colors.white,
//              ),
//              label: Text(
//                "Add to Cart",
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}

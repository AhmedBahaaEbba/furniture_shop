import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './buy_and_add_to_cart.dart';
import './product_image.dart';
import '../../providers/products.dart';
import '../utils/constants.dart';

class DetailsScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context, listen: false)
        .findProductById(productId);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Hero(
                          tag: '${product.id}',
                          child: ProductPoster(
                            size: size,
                            imageUrl: product.imageUrl,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          product.description,
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        BuyAndAddToCart(productId),
      ],
    );
  }
}

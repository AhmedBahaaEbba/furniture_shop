import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart' show Cart;
import '../../providers/orders.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'Cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OrderButton(cart: cart),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartItem(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                title: cart.items.values.toList()[i].title,
                quantity: cart.items.values.toList()[i].quantity,
                price: cart.items.values.toList()[i].price,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return (_isLoading)
        ? CircularProgressIndicator()
        : FlatButton(
            child: Text(
              'ORDER NOW',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: (widget.cart.totalAmount <= 0)
                ? null
                : () async {
                    setState(
                      () {
                        _isLoading = true;
                      },
                    );

                    await Provider.of<Orders>(context, listen: false).addOrder(
                        widget.cart.items.values.toList(),
                        widget.cart.totalAmount);
                    widget.cart.clear();
                    setState(
                      () {
                        _isLoading = false;
                      },
                    );
                  },
          );
  }
}

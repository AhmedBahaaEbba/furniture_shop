import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/utils/CustomTextStyle.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_app_bar.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_drawer.dart';
import 'package:furniture_shop/providers/cart.dart';
import 'package:furniture_shop/providers/orders.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: MainAppBar('Your Cart'),
      drawer: MainDrawer(),
//        resizeToAvoidBottomPadding: false,
//        resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: <Widget>[
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
          (cart.items.isEmpty)
              ? Container(
                  width: double.infinity,
                  child: (_isLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'You Cart Is Empty',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            (_isLoading)
                                ? CircularProgressIndicator()
                                : FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: kSecondaryColor,
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/');
                                    },
                                    child: Text(
                                      'Shop Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                          ],
                        ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (ctx, index) => CartListItem(index),
                          itemCount: cart.items.length,
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "( ${cart.items.length} ) items",
//                  style: CustomTextStyle.textFormFieldMedium
//                      .copyWith(color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Text(
                                    "\$${cart.totalAmount}",
//                  style: CustomTextStyle.textFormFieldBlack.copyWith(
//                      color: Colors.greenAccent.shade700, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            RaisedButton(
                              onPressed: () async {
                                setState(
                                  () {
                                    _isLoading = true;
                                  },
                                );

                                await Provider.of<Orders>(context,
                                        listen: false)
                                    .addOrder(cart.items.values.toList(),
                                        cart.totalAmount);
                                cart.clear();
                                setState(
                                  () {
                                    _isLoading = false;
                                  },
                                );
                                showToast(
                                  "You made new order! Check out Your orders",
                                  position: ToastPosition.center,
                                  backgroundColor: kPrimaryColor,
                                  dismissOtherToast: true,
                                );

//                                Navigator.of(context).push(
//                                  MaterialPageRoute(
//                                    builder: (context) => CheckOutPage(),
//                                  ),
//                                );
                              },
                              color: kSecondaryColor,
                              padding: EdgeInsets.only(
                                  top: 12, left: 60, right: 60, bottom: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                              child: Text(
                                "ORDER NOW",
                                style: CustomTextStyle.textFormFieldSemiBold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 16),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final int index;
  CartListItem(this.index);
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    double total = cart.items.values.toList()[index].price *
        cart.items.values.toList()[index].quantity;
    return Dismissible(
      key: ValueKey(cart.items.values.toList()[index].id),
      background: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).errorColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to remove the item from the cart?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                  ),
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                ],
              );
            });
      },
      onDismissed: (direction) {
        cart.removeItem(cart.items.keys.toList()[index]);
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                      image: NetworkImage(
                        cart.items.values.toList()[index].imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            cart.items.values.toList()[index].title,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                        Text(
                          "Price: \$${cart.items.values.toList()[index].price}",
                          style: CustomTextStyle.textFormFieldRegular
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "\$$total",
                                style: TextStyle(
                                  color: kSecondaryColor,
                                ),

//                              style: CustomTextStyle.textFormFieldBlack
//                                  .copyWith(color: Colors.green),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        size: 24,
                                        color: Colors.grey.shade700,
                                      ),
                                      onPressed: () {
                                        cart.removeSingleItem(
                                          cart.items.keys.toList()[index],
                                        );
                                      },
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 12, right: 12, left: 12),
                                      child: Text(
                                        cart.items.values
                                            .toList()[index]
                                            .quantity
                                            .toString(),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        size: 24,
                                        color: Colors.grey.shade700,
                                      ),
                                      onPressed: () {
                                        cart.addQuantity(
                                          cart.items.keys.toList()[index],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 100,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: InkWell(
                onTap: () {
                  cart.removeItem(cart.items.keys.toList()[index]);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: kSecondaryColor),
            ),
          )
        ],
      ),
    );
  }
}

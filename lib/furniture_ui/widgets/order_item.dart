import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'total : ${widget.order.amount.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '( ${widget.order.products.length} ) items',
                ),
              ],
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(DateTime.now()),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(
                  () {
                    _expanded = !_expanded;
                  },
                );
              },
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: min(widget.order.products.length * 20.0 + 70, 120),
                child: Column(
                  children: <Widget>[
                    Divider(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        children: widget.order.products
                            .map(
                              (prod) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    prod.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${prod.quantity}x \$${prod.price}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

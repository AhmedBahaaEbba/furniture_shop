import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    String title,
    String imageUrl,
    double price,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          imageUrl: existingCartItem.imageUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingProduct) => CartItem(
          id: existingProduct.id,
          title: existingProduct.title,
          quantity: existingProduct.quantity - 1,
          price: existingProduct.price,
          imageUrl: existingProduct.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void addQuantity(productId) {
    _items.update(
      productId,
      (existingProduct) => CartItem(
        id: existingProduct.id,
        title: existingProduct.title,
        quantity: existingProduct.quantity + 1,
        price: existingProduct.price,
        imageUrl: existingProduct.imageUrl,
      ),
    );
    notifyListeners();
  }
}

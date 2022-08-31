import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String id) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    var url = 'https://furniture_shop-c143f.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(
        url,
        body: jsonEncode(
          {
            'isFavorite': isFavorite,
          },
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
}

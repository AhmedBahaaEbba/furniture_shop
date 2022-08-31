import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture_shop/models/http_exception.dart';
import 'package:http/http.dart' as http;

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  Future<void> addProduct(Product product) async {
    const url = 'https://furniture_shop-c143f.firebaseio.com/products.json';
    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite,
            'category': product.category
          },
        ),
      );

      final newProduct = Product(
        id: jsonDecode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        category: product.category,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchAndSetAllProducts() async {
    const url = 'https://furniture_shop-c143f.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      List<Product> loadedProducts = [];
      extractedData.forEach(
        (productId, productData) {
          loadedProducts.add(
            Product(
              id: productId,
              title: productData['title'],
              description: productData['description'],
              price: productData['price'],
              imageUrl: productData['imageUrl'],
              isFavorite: productData['isFavorite'],
              category: productData['category'],
            ),
          );
        },
      );
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchAndSetCategory(String category) async {
    const url = 'https://furniture_shop-c143f.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      List<Product> loadedProducts = [];
      extractedData.forEach(
        (productId, productData) {
          loadedProducts.add(
            Product(
              id: productId,
              title: productData['title'],
              description: productData['description'],
              price: productData['price'],
              imageUrl: productData['imageUrl'],
              isFavorite: productData['isFavorite'],
              category: productData['category'],
            ),
          );
        },
      );
      _items = loadedProducts.where((product) => product.category == category);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Product> get favoritesItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get favorites {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get items {
    return [..._items];
  }

  Product findProductById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  Future<void> updateProduct(Product newProduct) async {
    final productIndex =
        _items.indexWhere((product) => product.id == newProduct.id);
    if (productIndex >= 0) {
      _items[productIndex] = newProduct;
      final url =
          'https://furniture_shop-c143f.firebaseio.com/products/${newProduct.id}.json';
      await http.patch(
        url,
        body: jsonEncode(
          {
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
            'isFavorite': newProduct.isFavorite,
            'category': newProduct.category,
          },
        ),
      );
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://furniture_shop-c143f.firebaseio.com/products/$id.json';
    final existingProductIndex =
        _items.indexWhere((product) => product.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('can not delete the product');
    }
    existingProduct = null;
  }

  List<Product> getOneCategory(String category) {
    return _items.where((product) => product.category == category).toList();
  }
}

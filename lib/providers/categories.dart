import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [];

  Future<void> addCategory(Category category) async {
    const url = 'https://furniture_shop-c143f.firebaseio.com/categories.json';
    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            'title': category.title,
          },
        ),
      );

      final newCategory = Category(
        id: jsonDecode(response.body)['name'],
        title: category.title,
      );
      _categories.add(newCategory);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchAndSetCategories() async {
    const url = 'https://furniture_shop-c143f.firebaseio.com/categoreis.json';
    try {
      final response = await http.get(url);
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      List<Category> loadedCategories = [];
      extractedData.forEach(
        (categoryId, categoryData) {
          loadedCategories.add(
            Category(
              id: categoryId,
              title: categoryData['title'],
            ),
          );
        },
      );
      _categories = loadedCategories;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}

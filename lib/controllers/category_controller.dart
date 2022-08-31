import 'package:furniture_shop/models/base_category.dart';

class CategoryController {
  BaseCategory category;

  CategoryController(this.category);

  static List<BaseCategory> toCategories(
      List<Map<String, dynamic>> jsonObjects) {}
}

import 'package:furniture_shop/models/base_product.dart';

class ProductController {
  BaseProduct product;

  ProductController(this.product);

  static List<BaseProduct> toProducts(List<Map<String, dynamic>> jsonObjects) {}
}

import 'package:furniture_shop/controllers/category_controller.dart';
import 'package:furniture_shop/controllers/discount_controller.dart';
import 'package:furniture_shop/controllers/image_controller.dart';
import 'package:furniture_shop/controllers/tag_controller.dart';

import 'base_category.dart';
import 'base_discount.dart';
import 'base_image.dart';
import 'base_option.dart';
import 'base_tag.dart';

class BaseProduct {
  String id;
  String title;
  String description;
  double price;
  double quantity;
  List<BaseImage> images;
  List<BaseProductOption> options;
  List<BaseCategory> categories;
  List<BaseTag> tags;
  List<BaseDiscount> discounts;

  BaseProduct(this.id, this.title, this.description, this.price, this.quantity,
      this.images, this.options, this.categories, this.tags, this.discounts);

  BaseProduct.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.images = ImageController.toImages(jsonObject['images']);
    this.categories = CategoryController.toCategories(jsonObject['categories']);
    this.tags = TagController.toTags(jsonObject['tags']);
    this.discounts = DiscountController.toDiscounts(jsonObject['discounts']);
  }
}

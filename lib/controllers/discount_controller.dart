import 'package:furniture_shop/models/base_discount.dart';

class DiscountController {
  BaseDiscount discount;

  DiscountController(this.discount);

  static List<BaseDiscount> toDiscounts(
      List<Map<String, dynamic>> jsonObjects) {}
}

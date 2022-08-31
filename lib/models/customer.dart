import 'package:furniture_shop/controllers/order_controller.dart';
import 'package:furniture_shop/controllers/product_controller.dart';

import 'address.dart';
import 'base_order.dart';
import 'base_product.dart';
import 'user.dart';

class Customer extends User {
  Address shippingAddress;
  Address billingAddress;

  List<BaseProduct> watchList;
  List<BaseOrder> orders;

  Customer(
      String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      String gender,
      Address shippingAddress,
      Address billingAddress,
      List<BaseProduct> watchList,
      List<BaseOrder> orders)
      : super(id, firstName, lastName, email, phone, gender) {
    this.shippingAddress = shippingAddress;
    this.billingAddress = billingAddress;
    this.orders = orders;
    this.watchList = watchList;
  }

  Customer.fromJson(Map<String, dynamic> jsonObject)
      : super(
            jsonObject['id'],
            jsonObject['first_name'],
            jsonObject['last_name'],
            jsonObject['email'],
            jsonObject['phone'],
            jsonObject['gender']) {
    this.shippingAddress = Address.fromJson(jsonObject['shipping_address']);
    this.billingAddress = Address.fromJson(jsonObject['billing_address']);
    this.watchList = ProductController.toProducts(jsonObject['watch_list']);
    this.orders = OrderController.toOrders(jsonObject['orders']);
  }
}

import 'package:furniture_shop/models/base_order.dart';
import 'package:furniture_shop/models/base_product.dart';
import 'package:furniture_shop/models/customer.dart';

class CustomerController {
  Customer customer;

  CustomerController(this.customer);

  void addToOrders(BaseOrder order) {
    this.customer.orders.add(order);
  }

  void addToWatchList(BaseProduct product) {
    this.customer.watchList.add(product);
  }

  bool orderInOrders(BaseOrder order) {
    return this.customer.orders.contains(order);
  }

  bool productInWatchList(BaseProduct product) {
    return this.customer.watchList.contains(product);
  }

  bool removeProductFromWatchList(BaseProduct product) {
    return this.customer.watchList.remove(product);
  }
}

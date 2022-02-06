import 'package:velocity_x/velocity_x.dart';
import 'package:wordpair_generator/models/cart.dart';
import 'package:wordpair_generator/models/catalog.dart';

class Store extends VxStore {
  late Catalog catalog;
  late CartModel cart;

  Store() {
    catalog = Catalog();
    cart = CartModel();
    cart.catalog = catalog;
  }
}

import 'package:velocity_x/velocity_x.dart';
import 'package:wordpair_generator/core/store.dart';
import 'package:wordpair_generator/models/catalog.dart';

class CartModel {
  late Catalog _catalog;
  final List<int> _itemsIds = [];

  Catalog get catalog => _catalog;

  set catalog(Catalog newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, current) => previousValue + current.price);
}

class AddMutation extends VxMutation<Store> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemsIds.add(item.id.toInt());
  }
}

class RemoveMutation extends VxMutation<Store> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemsIds.remove(item.id.toInt());
  }
}

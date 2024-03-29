import 'package:learningproject/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;
  //catalog field
 late CatalogModel _catalog;

  //collection of ids stored ids of each item
  final List<int> _itemIds = [];

//Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

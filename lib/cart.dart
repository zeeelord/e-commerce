import 'package:test/items.dart';
import 'package:test/pro.dart';

class Cart {
  final Map<int, Item> _items = {};
  void addProduct(Product product) {
    //  Product(name: 'apples', id: 1, price: 1.60),
    //
    final item = _items[product.id];
    //items[1] ;
    if (item == null) {
      // check if theres not any item
      _items[product.id] =
          Item(product: product, quantity: 1); //items[1]= Items() ;
    } else {
      //  if there is add one to it
      _items[product.id] = Item(
          product: product,
          quantity: item.quantity +
              1); // adding this to the _item in a sense  item[product.id(key)=Item(product: product, quantity: item.quantity + 1)(which is the value) ]
    }
  }

  bool get IsEmpty => _items.isEmpty;

  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  String toString() {
    if (_items.isEmpty) {
      return 'cart is empty';
    }
    final itemizedList =
        _items.values.map((item) => item.toString()).join('\n');
    return '$itemizedList \nTotal: \$total()';
  }
}

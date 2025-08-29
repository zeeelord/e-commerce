import 'package:test/pro.dart';

class Item {
  // ___________________________________________
  // this checks or item quantity
  Item({required this.product, this.quantity = 1}); // default quanity is 1
  final Product product;
  final int quantity;
  double get price => quantity * product.price;
  String toString() {
    return '$quantity x {product.name}: \$$price';
  }
}

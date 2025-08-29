class Product {
  const Product({required this.name, required this.price, required this.id});
  final String name;
  final double price;
  final int id;
  String get initial => name.substring(0, 1);
  String get displayName => '($initial) ${name.substring(1)} \$$price';
  // this outputs something like this (A) name
}

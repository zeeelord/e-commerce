import 'dart:io';

// creating a class product i.e Product(name price and id );
class Product {
  const Product({required this.name, required this.price, required this.id});
  final String name;
  final double price;
  final int id;
// getting the name first character and telling it start from  the first letter and end at it
  String get initial => name.substring(0, 1);
// getting the display name to display the content  product.display  i.e = name: 'apples  price: 1.60
  String get displayName => '($initial) $name.substring()}: \$$price';
}

class Item {
  Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;
  double get price => quantity * product.price;
}

class Cart {
  final Map<int, Item> _items = {};
  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }
}
// loop
//prompt view cart/ add item/ checkout
//if selection  ==add item
//choose a product
//add it to cart
// print cart
// else if selection == view cart
//print cart
//else if selection  ==checkout
//do check out
// exit
//end

final allProducts = [
  Product(name: 'apples', id: 1, price: 1.60),
  Product(name: 'bananas', id: 2, price: 0.70),
  Product(name: 'courgettes', id: 3, price: 1.0),
  Product(name: 'courgettes', id: 4, price: 1.0),
  Product(name: 'grapes', id: 5, price: 1.50),
  Product(name: 'mushrooms', id: 6, price: 0.80),
  Product(name: 'potatatoes', id: 7, price: 1.50),
];

Product? chooseProduct() {
  final productsList =
      allProducts.map((product) => product.displayName).join('\n');
  stdout.write('Available products: \n $productsList\n your choice:');
  final line = stdin.readLineSync();
  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }
  print("Not Found");
  return null;
}

void main() {
  while (true) {
    stdout.write(
        'What do you want to do? (v)iew items, (a)dd items, (c)heckout:');
    final line = stdin.readLineSync();
    if (line == "a") {
      final product = chooseProduct();
      if (product != null) {
        print(product.displayName);
      }
    } else if (line == 'v') {
      //TODO: Implement
    } else if (line == 'c') {
      //TODO: Implement
    }
  }
}

import 'dart:io';

// creating a class product i.e Product(name price and id );
class Product {
  const Product({required this.name, required this.price, required this.id});
  final String name;
  final double price;
  final int id;
  String get initial => name.substring(0, 1);
  String get displayName => '($initial) ${name.substring(1)} \$$price';
  // this outputs something like this (A) name
}

// getting the name first character and telling it start from  the first letter and end at it
// getting the display name to display the content  product.display  i.e = name: 'apples  price: 1.60

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

bool checkout(Cart cart) {
  if (cart.IsEmpty) {
    print('cart is empty');
    return false;
  }
  final total = cart.total();
  print('Total:\$$total');
  stdout.write('payment in cash');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }
  final paid = double.tryParse(line); //] converts a string to a double number
  if (paid == null) {
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print("Change : \$${change.toStringAsFixed(2)}");
    return true;
  } else {
    print("Not enough cash ");
    return false;
  }
}

void main() {
  final cart = Cart();
  while (true) {
    stdout.write(
        'What do you want to do? (v)iew items, (a)dd items, (c)heckout:');
    final line = stdin.readLineSync();
    if (line == "a") {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print(cart);
      }
    } else if (line == 'v') {
      print(cart);
    } else if (line == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

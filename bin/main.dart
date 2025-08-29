// creating a class product i.e Product(name price and id );
import 'dart:io';

import 'package:test/cart.dart';
import 'package:test/data.dart';
import 'package:test/pro.dart';

// getting the name first character and telling it start from  the first letter and end at it
// getting the display name to display the content  product.display  i.e = name: 'apples  price: 1.60

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

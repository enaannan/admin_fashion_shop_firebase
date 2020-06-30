import 'package:admin_fashion_shop/Models/products.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

//todo: all products read from the same quantity variable. fix it
class CrochetData extends ChangeNotifier {
  static int _quantity = 1;

  List<Product> _crochetProducts = [
    Product(
        price: 20,
        name: 'Tink Crochet Blouse',
        imagePath: 'images/bag.jpeg',
        quantity: _quantity),
    Product(
        price: 35,
        name: 'Cripple Top',
        imagePath: 'images/fashion2.jpg',
        quantity: _quantity),
    Product(
        price: 50,
        name: 'shirt',
        imagePath: 'images/fashion3.jpg',
        quantity: _quantity),
    Product(
        price: 20,
        name: 'Tink Crochet Blouse',
        imagePath: 'images/bag.jpeg',
        quantity: _quantity),
    Product(
        price: 30,
        name: 'Cripple Top',
        imagePath: 'images/fashion2.jpg',
        quantity: _quantity),
    Product(
        price: 0,
        name: 'shirt',
        imagePath: 'images/fashion3.jpg',
        quantity: _quantity),
  ];

  UnmodifiableListView<Product> get chrochetProducts {
    return UnmodifiableListView(_crochetProducts);
  }

  int get productCount {
    return _crochetProducts.length;
  }

  //adds a new product to the list
  String addProduct({newCrochetProductName, newCrochetPrice, newImagePath}) {
    int initialLength = productCount;
    final product = Product(
        price: newCrochetPrice,
        name: newCrochetProductName,
        imagePath: newImagePath);
    _crochetProducts.add(product);
    notifyListeners();

    //for unit test
    int finalLength = productCount;

    if (finalLength > initialLength) {
      return "success";
    } else
      return "fail";
  }

  //increase quantity

  void increaseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity > 0) {
      _quantity--;
    }
    notifyListeners();
  }

  int getQuantity() {
    return _quantity;
  }
}

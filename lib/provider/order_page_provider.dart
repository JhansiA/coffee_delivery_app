import 'package:coffee_delivery_app/models/product.dart';
import 'package:flutter/material.dart';

// import 'dart:collection';

class OrderPageProvider with ChangeNotifier {
  List<Product> products = [];
  final List<Product> _cartItems = [];
  int cartItemCount = 0;
  int? index;
  Product? updatedProduct;
  void addProduct(Product product) {
    updatedProduct = Product(
        shotType: product.shotType,
        quantity: product.quantity,
        coffeeType: product.coffeeType,
        size: product.size,
        ice: product.ice,
        name: product.name,
        image: product.image,
        price: product.price);

    products.add(updatedProduct!);

    index = products.lastIndexWhere(
        (productToCheck) => (productToCheck.name == updatedProduct!.name));
  }

  // void removeProduct(Product product) {
  //   products.remove(product);
  // }

  Product get productDetails => products[index!];

  List<Product> get cartDetails => _cartItems;
  // UnmodifiableListView<Product> get cartDetails {
  //   return UnmodifiableListView(_cartItems);
  // }

  int get cartCount => cartItemCount;

  void quantityIncrement() {
    products[index!].quantity++;
    notifyListeners();
  }

  void quantityDecrement() {
    if (products[index!].quantity > 1) {
      products[index!].quantity--;
      notifyListeners();
    }
  }

  void updateCoffeeType(String type) {
    products[index!].coffeeType = type;
    notifyListeners();
  }

  void updateFlavour(String flavour) {
    products[index!].shotType = flavour;
    notifyListeners();
  }

  void updateCupSize(String size) {
    products[index!].size = size;
    notifyListeners();
  }

  void updateIce(String ice) {
    products[index!].ice = ice;
    notifyListeners();
  }

  void addToCart() {
    _cartItems.add(products[index!]);
    cartItemCount = cartItemCount + products[index!].quantity;
    notifyListeners();
  }

  void addToRedeemCart(Product product) {
    _cartItems.add(product);
    cartItemCount = cartItemCount + product.quantity;
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartItemCount = cartItemCount - _cartItems[index].quantity;
    _cartItems.removeAt(index);
    // print(_cartItems.length);

    notifyListeners();
  }

  void cleanCart() {
    _cartItems.clear();
    products.clear();
    cartItemCount = 0;
    notifyListeners();
  }
}

class Product {
  // ignore: non_constant_identifier_names
  final String name, image;
  String shotType, coffeeType, size, ice;
  Map<String, int> price;
  int quantity;
  Product(
      {required this.shotType,
      required this.quantity,
      required this.coffeeType,
      required this.size,
      required this.ice,
      required this.name,
      required this.image,
      required this.price});
}

List<Product> products = [
  Product(
      name: 'Americano',
      image: 'assets/images/Americano.png',
      price: {'tall': 3, 'grande': 5, 'venti': 7},
      quantity: 1,
      shotType: 'Single',
      coffeeType: 'hot',
      size: 'tall',
      ice: 'medium'),
  Product(
      name: 'Cappuccino',
      image: 'assets/images/Cappuccino.png',
      price: {'tall': 3, 'grande': 5, 'venti': 7},
      quantity: 1,
      shotType: 'Single',
      coffeeType: 'hot',
      size: 'tall',
      ice: 'medium'),
  Product(
      name: 'Mocha',
      image: 'assets/images/Mocha.png',
      price: {'tall': 3, 'grande': 5, 'venti': 7},
      quantity: 1,
      shotType: 'Single',
      coffeeType: 'hot',
      size: 'tall',
      ice: 'medium'),
  Product(
      name: 'Flat White',
      image: 'assets/images/FlatWhite.png',
      price: {'tall': 3, 'grande': 5, 'venti': 7},
      quantity: 1,
      shotType: 'Single',
      coffeeType: 'hot',
      size: 'tall',
      ice: 'medium'),
];

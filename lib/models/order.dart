class Order {
  String ordername, orderaddress;
  DateTime orderdate;
  double orderprice;
  Order({
    required this.ordername,
    required this.orderaddress,
    required this.orderdate,
    required this.orderprice,
  });
}

List<Order> currentorder = [
  Order(
      ordername: 'Americano',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now(),
      orderprice: 3.00),
  Order(
      ordername: 'Cafe Latte',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now(),
      orderprice: 7.00),
  Order(
      ordername: 'Flat White',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now(),
      orderprice: 5.00),
];

List<Order> orderhistory = [
  Order(
      ordername: 'Cappuccino',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now().subtract(const Duration(days: 0, hours: 10)),
      orderprice: 3.00),
  Order(
      ordername: 'Mocha',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now().subtract(const Duration(days: 0, hours: 10)),
      orderprice: 7.00),
  Order(
      ordername: 'Flat White',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now().subtract(const Duration(days: 1, hours: 10)),
      orderprice: 5.00),
  Order(
      ordername: 'Americano',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now().subtract(const Duration(days: 2, hours: 10)),
      orderprice: 3.00),
  Order(
      ordername: 'Cafe Latte',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now().subtract(const Duration(days: 2, hours: 10)),
      orderprice: 7.00),
  Order(
      ordername: 'Flat White',
      orderaddress: '3 Addersion Court Chino Hills, HO56824, United State',
      orderdate: DateTime.now().subtract(const Duration(days: 3, hours: 10)),
      orderprice: 5.00),
];

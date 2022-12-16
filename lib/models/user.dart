class User {
  final String name, email, address, phonenumber;
  User(
      {required this.name,
      required this.email,
      required this.address,
      required this.phonenumber});
}

User user = User(
    name: 'Anderson',
    email: 'Anderson@email.com',
    address: '3 Addersion Court Chino Hills, HO56824, United State',
    phonenumber: '+60134589525');

class Reward {
  String name;
  DateTime date;
  int pointsEarned;
  Reward({required this.name, required this.date, required this.pointsEarned});
}

List<Reward> rewards = [
  Reward(name: 'Americano', date: DateTime.now(), pointsEarned: 12),
  Reward(
      name: 'Cafe Latte',
      date: DateTime.now().subtract(const Duration(days: 0, hours: 10)),
      pointsEarned: 12),
  Reward(
      name: 'Green Tea Latte',
      date: DateTime.now().subtract(const Duration(days: 1, hours: 10)),
      pointsEarned: 12),
  Reward(
      name: 'Flat White',
      date: DateTime.now().subtract(const Duration(days: 2, hours: 10)),
      pointsEarned: 12),
  Reward(
      name: 'Cafe Latte',
      date: DateTime.now().subtract(const Duration(days: 3, hours: 10)),
      pointsEarned: 12),
  Reward(
      name: 'Cafe Latte',
      date: DateTime.now().subtract(const Duration(days: 3, hours: 10)),
      pointsEarned: 12),
];

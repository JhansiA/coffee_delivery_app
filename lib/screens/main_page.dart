import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'orders/my_orders.dart';
import 'rewards/rewards_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _pageIndex = 0;
  final List<Widget> screens = [
    const HomePage(),
    const MyRewards(),
    const MyOrders(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_pageIndex],
      bottomNavigationBar: buildCustomNavBar(),
    );
  }

  Widget buildCustomNavBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 40),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: kDefaultBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: kSecondaryBackgroundColor.withOpacity(0.1),
              blurRadius: 20.0,
              spreadRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navigationBarButtons('assets/icons/home.png', 0, () {
              setState(() {
                _pageIndex = 0;
              });
            }),
            navigationBarButtons('assets/icons/rewards.png', 1, () {
              setState(() {
                _pageIndex = 1;
              });
            }),
            navigationBarButtons('assets/icons/order.png', 2, () {
              setState(() {
                _pageIndex = 2;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget navigationBarButtons(String image, int index, VoidCallback onPressed) {
    return IconButton(
      enableFeedback: false,
      onPressed: onPressed,
      icon: Image.asset(
        image,
        color: _pageIndex == index
            ? kSecondaryBackgroundColor
            : kSecondaryTextColor,
      ),
    );
  }
}

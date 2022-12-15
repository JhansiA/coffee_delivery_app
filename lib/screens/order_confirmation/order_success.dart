import 'package:coffee_delivery_app/components/rounded_button.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/screens/main_page.dart';
import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Image.asset('assets/icons/take-away.png'),
            const SizedBox(height: 40),
            const Text('Order Success',
                style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            const Text('your order has been placed successfully.',
                style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            const Text('For more details,go to my orders.',
                style: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RoundedButton(
                width: double.infinity,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const MainHomePage()),
                      (Route<dynamic> route) => false);
                },
                widget: const Text('Track My Order',
                    style: TextStyle(color: kDefaultTextColor, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

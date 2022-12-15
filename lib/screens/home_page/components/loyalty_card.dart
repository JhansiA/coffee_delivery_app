import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class LoyaltyCard extends StatelessWidget {
  const LoyaltyCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int loyaltyPoints = 4;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kSecondaryBackgroundColor,
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Loyalty card',
                  style: TextStyle(fontSize: 16, color: kSecondaryTextColor),
                ),
                Text(
                  '$loyaltyPoints / 8',
                  style:
                      const TextStyle(fontSize: 16, color: kSecondaryTextColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kContainerColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getImageWidgets(loyaltyPoints),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget getImageWidgets(int points) {
  List<Widget> list = [];
  for (var point = 1; point <= 8; point++) {
    if (point <= points) {
      list.add(Image.asset('assets/icons/coffee-cup.png'));
    } else {
      list.add(Image.asset('assets/icons/coffee-cup1.png'));
    }
  }
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
}

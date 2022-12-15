import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType({
    Key? key,
  }) : super(key: key);

  // String coffeeType = 'hot';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Select',
            style: TextStyle(color: kPrimaryTextColor, fontSize: 14)),
        Row(
          children: [
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateCoffeeType('hot'),
                child: Image.asset(
                  'assets/icons/coffee-type1.png',
                  color: context
                              .watch<OrderPageProvider>()
                              .productDetails
                              .coffeeType ==
                          'hot'
                      ? kPrimaryTextColor
                      : kSecondaryTextColor,
                )),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateCoffeeType('cold'),
                child: Image.asset(
                  'assets/icons/coffee-type2.png',
                  color: context
                              .watch<OrderPageProvider>()
                              .productDetails
                              .coffeeType ==
                          'cold'
                      ? kPrimaryTextColor
                      : kSecondaryTextColor,
                )),
          ],
        ),
      ],
    );
  }
}

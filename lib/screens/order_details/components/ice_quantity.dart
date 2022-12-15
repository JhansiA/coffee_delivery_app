import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IceCubes extends StatelessWidget {
  const IceCubes({
    Key? key,
  }) : super(key: key);

  // String ice = 'medium';
  @override
  Widget build(BuildContext context) {
    String coffeeType =
        context.watch<OrderPageProvider>().productDetails.coffeeType;
    String iceType = context.watch<OrderPageProvider>().productDetails.ice;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Ice',
            style: TextStyle(color: kPrimaryTextColor, fontSize: 14)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateIce('less'),
                child: Image.asset(
                  'assets/icons/ice_1.png',
                  color: iceType == 'less' && coffeeType != 'hot'
                      ? kPrimaryTextColor
                      : kSecondaryTextColor,
                )),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateIce('medium'),
                child: Image.asset(
                  'assets/icons/ice_2.png',
                  color: iceType == 'medium' && coffeeType != 'hot'
                      ? kPrimaryTextColor
                      : kSecondaryTextColor,
                )),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateIce('full'),
                child: Image.asset(
                  'assets/icons/ice_3.png',
                  color: iceType == 'full' && coffeeType != 'hot'
                      ? kPrimaryTextColor
                      : kSecondaryTextColor,
                )),
          ],
        ),
      ],
    );
  }
}

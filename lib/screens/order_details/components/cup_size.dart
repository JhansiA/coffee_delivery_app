import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CupSize extends StatelessWidget {
  const CupSize({
    Key? key,
  }) : super(key: key);

  // String cupsize = 'tall';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Size',
            style: TextStyle(color: kPrimaryTextColor, fontSize: 14)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateCupSize('tall'),
                child: Image.asset(
                  'assets/icons/tall.png',
                  color:
                      context.watch<OrderPageProvider>().productDetails.size ==
                              'tall'
                          ? kPrimaryTextColor
                          : kSecondaryTextColor,
                )),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateCupSize('grande'),
                child: Image.asset(
                  'assets/icons/Grande.png',
                  color:
                      context.watch<OrderPageProvider>().productDetails.size ==
                              'grande'
                          ? kPrimaryTextColor
                          : kSecondaryTextColor,
                )),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateCupSize('venti'),
                child: Image.asset(
                  'assets/icons/venti.png',
                  color:
                      context.watch<OrderPageProvider>().productDetails.size ==
                              'venti'
                          ? kPrimaryTextColor
                          : kSecondaryTextColor,
                )),
          ],
        ),
      ],
    );
  }
}

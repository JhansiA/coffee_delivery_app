import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlavorSelection extends StatelessWidget {
  const FlavorSelection({
    Key? key,
  }) : super(key: key);

  // String flavour = 'Single';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Shot',
            style: TextStyle(color: kPrimaryTextColor, fontSize: 14)),
        Row(
          children: [
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateFlavour('Single'),
                child: ShotContainer(
                    title: 'Single',
                    flavour: context
                        .watch<OrderPageProvider>()
                        .productDetails
                        .shotType)),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () =>
                    context.read<OrderPageProvider>().updateFlavour('Double'),
                child: ShotContainer(
                    title: 'Double',
                    flavour: context
                        .watch<OrderPageProvider>()
                        .productDetails
                        .shotType)),
          ],
        )
      ],
    );
  }
}

class ShotContainer extends StatelessWidget {
  final String title;
  final String flavour;
  const ShotContainer({
    Key? key,
    required this.title,
    required this.flavour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 75,
      decoration: kOrderContainerDecor,
      child: Text(title,
          style: TextStyle(
              color: flavour == title ? kPrimaryTextColor : kSecondaryTextColor,
              fontSize: 14)),
    );
  }
}

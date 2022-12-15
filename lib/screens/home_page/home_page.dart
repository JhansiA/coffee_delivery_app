import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

import 'components/loyalty_card.dart';
import 'components/products_list.dart';
import 'components/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TopBar(),
            const LoyaltyCard(),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: kSecondaryBackgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'choose your coffee',
                        style:
                            TextStyle(color: kSecondaryTextColor, fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProductList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

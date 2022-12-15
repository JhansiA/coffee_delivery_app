import 'package:badges/badges.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:coffee_delivery_app/screens/cart_details/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cartCount = context.watch<OrderPageProvider>().cartCount;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Good morning',
                style: TextStyle(color: kSecondaryTextColor, fontSize: 14),
              ),
              Text(
                'Anderson',
                style: TextStyle(color: kPrimaryTextColor, fontSize: 18),
              ),
            ],
          ),
          Row(
            children: [
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.shopping_cart_outlined,
              //         color: kPrimaryTextColor)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                },
                child: Center(
                  child: Badge(
                    showBadge: cartCount > 0 ? true : false,
                    badgeColor: kSecondaryBackgroundColor,
                    badgeContent: Text(cartCount.toString(),
                        style: const TextStyle(
                            color: kDefaultTextColor, fontSize: 12)),
                    animationType: BadgeAnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.shopping_cart_outlined,
                        color: kPrimaryTextColor, size: 28),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline_rounded,
                      color: kPrimaryTextColor, size: 28)),
            ],
          ),
        ],
      ),
    );
  }
}

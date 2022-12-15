import 'package:badges/badges.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:coffee_delivery_app/screens/cart_details/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPageCartIcon extends StatelessWidget {
  const OrderPageCartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cartCount = context.watch<OrderPageProvider>().cartCount;
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        },
        child: Center(
          child: Badge(
            showBadge: cartCount > 0 ? true : false,
            badgeColor: kSecondaryBackgroundColor,
            badgeContent: Text(cartCount.toString(),
                style: const TextStyle(color: kDefaultTextColor)),
            animationType: BadgeAnimationType.fade,
            animationDuration: const Duration(milliseconds: 300),
            child: const Icon(Icons.shopping_cart_outlined,
                color: kPrimaryTextColor),
          ),
        ),
      ),
    );
  }
}

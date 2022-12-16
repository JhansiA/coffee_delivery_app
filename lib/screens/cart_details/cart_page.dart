import 'package:coffee_delivery_app/components/appbar.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/cart_details.dart';
import 'components/checkout_price.dart';
import 'components/dismissible_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> cartdetails = context.watch<OrderPageProvider>().cartDetails;

    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      appBar: AppBarWithLeadingAndTitle(title: ''),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              cartdetails.isEmpty
                  ? const Text('Your cart is empty!',
                      style: TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500))
                  : Expanded(
                      child: ListView.builder(
                          itemCount: cartdetails.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartdetails[index];
                            return DismissibleWidget(
                              item: cartItem,
                              child: CartDetails(product: cartdetails[index]),
                              onDismissed: (direction) =>
                                  dismissItem(context, index, direction),
                            );
                          }),
                    ),
              cartdetails.isEmpty
                  ? Container()
                  : CheckoutPrice(cartdetails: cartdetails),
            ],
          ),
        ),
      ),
    );
  }

  void dismissItem(
    BuildContext context,
    int index,
    DismissDirection direction,
  ) {
    context.read<OrderPageProvider>().removeFromCart(index);
  }
}

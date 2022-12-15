import 'package:coffee_delivery_app/components/rounded_button.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/screens/cart_details/components/payment_total.dart';
import 'package:flutter/material.dart';

import 'delivery_address.dart';
import 'payment_options.dart';
import 'price_details.dart';

class CheckoutPrice extends StatelessWidget {
  const CheckoutPrice({
    Key? key,
    required this.cartdetails,
  }) : super(key: key);

  final List<Product> cartdetails;

  @override
  Widget build(BuildContext context) {
    double totalamount = cartdetails
        .map((item) => (item.quantity * item.price[item.size]!))
        .reduce((a, b) => a + b)
        .toDouble();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Price',
                style: TextStyle(
                  color: kSecondaryTextColor,
                  fontSize: 14,
                )),
            const SizedBox(
              height: 8.0,
            ),
            Text('\$${totalamount.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        RoundedButton(
          width: 160,
          onPressed: () {
            paymentPage(context, totalamount);
          },
          widget: const Text('Checkout',
              style: TextStyle(color: kDefaultTextColor, fontSize: 16)),
        ),
      ],
    );
  }

  Future<dynamic> paymentPage(BuildContext context, double totalamount) {
    double deliveryfee = 2;
    double tax = 0.1;
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: kDefaultBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Confirmation',
                    style: TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 20,
                ),
                const DeliverAddress(),
                const SizedBox(
                  height: 20,
                ),
                const PaymentOptions(),
                const SizedBox(
                  height: 40,
                ),
                PriceDetails(
                  total: totalamount,
                  deliveryfee: deliveryfee,
                  tax: tax,
                ),
                const SizedBox(
                  height: 40,
                ),
                PaymentTotal(
                  total: totalamount,
                  deliveryfee: deliveryfee,
                  tax: tax,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

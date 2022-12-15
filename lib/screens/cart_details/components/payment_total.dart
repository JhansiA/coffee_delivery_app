import 'package:coffee_delivery_app/components/rounded_button.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:coffee_delivery_app/screens/order_confirmation/order_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentTotal extends StatelessWidget {
  const PaymentTotal({
    Key? key,
    required this.total,
    required this.deliveryfee,
    required this.tax,
  }) : super(key: key);

  final double total;
  final double deliveryfee;
  final double tax;

  @override
  Widget build(BuildContext context) {
    double totalamount = total + (total * tax) + deliveryfee;

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
            context.read<OrderPageProvider>().cleanCart();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OrderSuccess()));
          },
          widget: Row(
            children: [
              Image.asset('assets/icons/cardsymbol.png'),
              const SizedBox(
                width: 10,
              ),
              const Text('Pay Now',
                  style: TextStyle(color: kDefaultTextColor, fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}

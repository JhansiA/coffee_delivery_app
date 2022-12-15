import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PricesRow(price: total, title: 'Subtotal'),
        const SizedBox(
          height: 20,
        ),
        PricesRow(price: (total * tax), title: 'Tax (10%)'),
        const SizedBox(
          height: 20,
        ),
        PricesRow(price: deliveryfee, title: 'Delivery fee'),
      ],
    );
  }
}

class PricesRow extends StatelessWidget {
  const PricesRow({
    Key? key,
    required this.price,
    required this.title,
  }) : super(key: key);

  final double price;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                color: kPrimaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        Text('\$${price.toStringAsFixed(2)}',
            style: const TextStyle(
                color: kPrimaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

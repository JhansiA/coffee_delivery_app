import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    int quantity = context.watch<OrderPageProvider>().productDetails.quantity;
    String size = context.watch<OrderPageProvider>().productDetails.size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total Amount',
            style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        Text('\$${(quantity * product.price[size]!).toStringAsFixed(2)}',
            style: const TextStyle(
                color: kPrimaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

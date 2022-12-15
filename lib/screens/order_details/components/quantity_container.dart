import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';

class QuantityContainer extends StatelessWidget {
  const QuantityContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.name,
          style: const TextStyle(color: kPrimaryTextColor, fontSize: 14),
        ),
        Container(
          height: 30,
          width: 75,
          decoration: kOrderContainerDecor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: IconButton(
                  onPressed: () =>
                      context.read<OrderPageProvider>().quantityDecrement(),
                  icon: const Icon(
                    Icons.remove,
                    color: kPrimaryTextColor,
                    size: 10,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '${context.watch<OrderPageProvider>().productDetails.quantity}',
                  style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () =>
                      context.read<OrderPageProvider>().quantityIncrement(),
                  icon: const Icon(
                    Icons.add,
                    color: kPrimaryTextColor,
                    size: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

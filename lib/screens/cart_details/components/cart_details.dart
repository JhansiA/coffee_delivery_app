import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:flutter/material.dart';

class CartDetails extends StatelessWidget {
  final Product product;

  const CartDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    String iceType = product.coffeeType == 'hot' ? '' : '| ${product.ice} ice';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 100,
        width: double.infinity,
        decoration: kCartItemContainerDecor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    product.image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product.name,
                          style: const TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                          '${product.shotType} | ${product.coffeeType} | ${product.size} $iceType',
                          style: const TextStyle(
                            color: kSecondaryTextColor,
                            fontSize: 12,
                          )),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('X${product.quantity}',
                          style: const TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  Text(
                      '\$${(product.quantity * product.price[product.size]!).toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

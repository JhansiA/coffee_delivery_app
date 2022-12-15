import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 130,
        width: 170,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              product.image,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

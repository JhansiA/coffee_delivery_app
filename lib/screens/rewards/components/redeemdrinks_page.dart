// ignore_for_file: file_names

import 'package:coffee_delivery_app/components/rounded_button.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RedeemDrinks extends StatelessWidget {
  const RedeemDrinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: const TextStyle(
            color: kPrimaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: kPrimaryTextColor)),
        title: const Text('Redeem'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductDetails(product: products[index]);
            }),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    int points = 1340;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 120,
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text('Valid until 04.07.21',
                      style: TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 12,
                      )),
                ],
              ),
            ],
          ),
          RoundedButton(
            width: 75,
            onPressed: () {
              context.read<OrderPageProvider>().addToRedeemCart(product);
              Navigator.pop(context);
            },
            widget: Text('${points.toString()} pts',
                style: const TextStyle(color: kDefaultTextColor, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

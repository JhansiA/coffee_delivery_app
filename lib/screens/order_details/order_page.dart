import 'package:coffee_delivery_app/components/appbar.dart';
import 'package:coffee_delivery_app/components/rounded_button.dart';
import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/cart_icon.dart';
import 'components/coffee_type.dart';
import 'components/cup_size.dart';
import 'components/flavor_selection.dart';
import 'components/ice_quantity.dart';
import 'components/price_details.dart';
import 'components/product_container.dart';
import 'components/quantity_container.dart';

class OrderPage extends StatelessWidget {
  final Product product;
  const OrderPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackgroundColor,
      appBar: AppBarWithLeadingAndTitle(
        title: 'Details',
        actions: const [OrderPageCartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
          children: [
            ProductContainer(product: product),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                QuantityContainer(product: product),
                kDivider,
                const FlavorSelection(),
                kDivider,
                const CoffeeType(),
                kDivider,
                const CupSize(),
                kDivider,
                const IceCubes(),
                const SizedBox(
                  height: 60,
                ),
                PriceDetails(product: product),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  width: double.infinity,
                  onPressed: () {
                    context.read<OrderPageProvider>().addToCart();
                    Navigator.pop(context);
                  },
                  widget: const Text('Add To Cart',
                      style: TextStyle(color: kDefaultTextColor, fontSize: 16)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

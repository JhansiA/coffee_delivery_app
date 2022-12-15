import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/screens/order_details/order_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_delivery_app/models/product.dart';
import 'package:provider/provider.dart';
import 'package:coffee_delivery_app/provider/order_page_provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Expanded(
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            Product product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => OrderPage(
                              product: product,
                            )));

                context.read<OrderPageProvider>().addProduct(product);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: kContainerColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 75,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                product.image,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

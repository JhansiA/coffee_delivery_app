import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.order, required this.textcolor});
  final Order order;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMM y').format(order.orderdate);
    String formattedTime = DateFormat.jm().format(order.orderdate);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$formattedDate | $formattedTime',
                    style: const TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/tall.png',
                      color: textcolor,
                      height: 15,
                    ),
                    const SizedBox(width: 10),
                    Text(order.ordername,
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            Text('\$${order.orderprice.toStringAsFixed(2)}',
                style: TextStyle(
                    color: textcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Image.asset(
              'assets/icons/Location.png',
              color: textcolor,
              height: 15,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(order.orderaddress,
                  style: TextStyle(
                      color: textcolor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        kDivider,
      ],
    );
  }
}

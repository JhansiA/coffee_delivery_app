import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/user.dart';
import 'package:flutter/material.dart';

class DeliverAddress extends StatelessWidget {
  const DeliverAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery Address',
            style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 40,
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                  child: Image.asset(
                'assets/icons/bike.png',
              )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(user.name,
                      style: const TextStyle(
                          color: kPrimaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  Text(
                    user.address,
                    style: const TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/icons/Edit.png',
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                )),
          ],
        ),
      ],
    );
  }
}

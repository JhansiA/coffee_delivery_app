import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/screens/rewards/components/redeemDrinks_page.dart';
import 'package:flutter/material.dart';

class RewardPointsCard extends StatelessWidget {
  const RewardPointsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalpoints = 2750;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kSecondaryBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Points:',
                  style: TextStyle(fontSize: 16, color: kSecondaryTextColor),
                ),
                const SizedBox(height: 10),
                Text(
                  totalpoints.toString(),
                  style:
                      const TextStyle(fontSize: 24, color: kSecondaryTextColor),
                ),
              ],
            ),
            totalpoints > 0
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RedeemDrinks()));
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xFFA2CDE9).withOpacity(0.19),
                      ),
                      child: const Center(
                        child: Text(
                          'Redeem drinks',
                          style: TextStyle(
                              fontSize: 14, color: kSecondaryTextColor),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

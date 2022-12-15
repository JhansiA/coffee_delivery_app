import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/screens/home_page/components/loyalty_card.dart';
import 'package:flutter/material.dart';
import 'components/rewardpoints_card.dart';
import 'components/rewards_history.dart';

class MyRewards extends StatelessWidget {
  const MyRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: kDefaultBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: const TextStyle(
            color: kPrimaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500),
        title: const Text('Rewards'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 14),
              LoyaltyCard(),
              SizedBox(height: 14),
              RewardPointsCard(),
              SizedBox(height: 14),
              RewardsHistory(),
            ]),
      ),
    );
  }
}

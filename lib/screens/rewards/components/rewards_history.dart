import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/rewards_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RewardsHistory extends StatelessWidget {
  const RewardsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('History Rewards',
              style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            //TODo : check with sri : render flex issue
            child: rewards.isEmpty
                ? const Text('No rewards available!',
                    style: TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
                : ListView.builder(
                    // shrinkWrap: true,
                    itemCount: rewards.length,
                    itemBuilder: (context, index) {
                      return RewardDetails(reward: rewards[index]);
                    }),
          ),
          // SingleChildScrollView(
          //   child: Column(
          //     children: rewards.map((reward) => rewardDetails(reward)).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class RewardDetails extends StatelessWidget {
  const RewardDetails({super.key, required this.reward});
  final Reward reward;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMM y').format(reward.date);
    String formattedTime = DateFormat.jm().format(reward.date);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reward.name,
                    style: const TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 5),
                Text('$formattedDate | $formattedTime',
                    style: const TextStyle(
                        color: kSecondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Text('+ ${reward.pointsEarned} Pts',
                style: const TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 10),
        kDivider,
      ],
    );
  }
}

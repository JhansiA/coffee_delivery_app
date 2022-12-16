import 'package:coffee_delivery_app/constants.dart';
import 'package:coffee_delivery_app/models/user.dart';
import 'package:flutter/material.dart';
import 'components/profile_details.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: kPrimaryTextColor)),
        ),
        title: const Text('Profile'),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetails(
                  icon: Icons.person_outline_rounded,
                  title: 'Full name',
                  data: user.name,
                ),
                ProfileDetails(
                  icon: Icons.call_outlined,
                  title: 'Phone number',
                  data: user.phonenumber,
                ),
                ProfileDetails(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  data: user.email,
                ),
                ProfileDetails(
                  icon: Icons.location_pin,
                  title: 'Address',
                  data: user.address,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

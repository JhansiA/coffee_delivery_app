import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class AppBarWithLeadingAndTitle extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarWithLeadingAndTitle({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);
  final String title;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
          color: kPrimaryTextColor, fontSize: 20, fontWeight: FontWeight.w500),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: kPrimaryTextColor)),
      ),
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class AppBarWithTitle extends StatelessWidget implements PreferredSizeWidget {
  AppBarWithTitle({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);
  final String title;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
          color: kPrimaryTextColor, fontSize: 20, fontWeight: FontWeight.w500),
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

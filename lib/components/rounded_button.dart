import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.widget,
      required this.onPressed,
      required this.width});

  // final Color colour;
  final Widget widget;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5.0,
        color: kSecondaryBackgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: 40.0,
          child: widget,
        ),
      ),
    );
  }
}

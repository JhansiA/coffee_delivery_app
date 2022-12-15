import 'package:flutter/material.dart';

const kPrimaryTextColor = Color(0xFF001833);
const kSecondaryTextColor = Color(0xFFD8D8D8);
const kDefaultTextColor = Color(0xFFFFFFFF);

const kDefaultBackgroundColor = Color(0xFFFFFFFF);
const kSecondaryBackgroundColor = Color(0xFF324A59);
const kContainerColor = Color(0xFFF7F8FB);

final kOrderContainerDecor = BoxDecoration(
  border: Border.all(color: kSecondaryTextColor),
  borderRadius: BorderRadius.circular(50.0),
);

final kCartItemContainerDecor = BoxDecoration(
  color: kContainerColor,
  borderRadius: BorderRadius.circular(15.0),
);

const kDivider = Divider(
  height: 30,
  thickness: 1.5,
  color: Color(0xFFF4F5F7),
);

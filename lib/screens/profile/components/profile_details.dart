import 'package:coffee_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);
  final IconData icon;
  final String title, data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kContainerColor),
                child: Center(
                    child:
                        Icon(icon, color: kSecondaryBackgroundColor, size: 30)),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(data,
                        style: const TextStyle(
                            color: kSecondaryBackgroundColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/Edit.png'),
                      fit: BoxFit.fill)),
              // child: Image.asset(
              //   'assets/icons/Edit.png',
              //   alignment: Alignment.center,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

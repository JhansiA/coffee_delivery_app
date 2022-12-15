import 'package:coffee_delivery_app/constants.dart';

import 'package:coffee_delivery_app/screens/main_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    navigator.pop();
    navigator.push(MaterialPageRoute(
        builder: (BuildContext context) => const MainHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/HomePage_image.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
            ),
            Image.asset("assets/icons/coffee.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ordinary Coffee House',
              style: TextStyle(color: kDefaultTextColor, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

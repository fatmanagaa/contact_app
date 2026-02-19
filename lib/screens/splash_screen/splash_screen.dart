import 'package:flutter/material.dart';

import '../../core/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      //todo: navigate to next screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(AppAssets.logoPhoto, width: 180, height: 60),
            ),
          ],
        ),
      ),
    );
  }
}

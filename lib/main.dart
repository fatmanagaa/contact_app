import 'package:contact_app/core/app_theme.dart';
import 'package:contact_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (context) => SplashScreen(),

      },

    );
  }
}

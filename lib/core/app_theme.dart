import 'package:flutter/material.dart';


import 'app_colors.dart';

class AppTheme {
  static ThemeData theme=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGrey,
      elevation: 0,


    ),
      scaffoldBackgroundColor: AppColors.darkGrey,

      elevatedButtonTheme: ElevatedButtonThemeData(

        style: ButtonStyle(

          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(AppColors.gold),
          fixedSize: MaterialStateProperty.all(const Size(340, 60)),

          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        ),

      )
  );
}
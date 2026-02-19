import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle bold20Gold = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.gold,
  );

  static TextStyle medium16Gold = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.gold,
  );
  static TextStyle medium16LightBlue = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.lightBlue,
  );
  static TextStyle medium16DarkGrey = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.darkGrey,
  );
  static TextStyle small10DarkGrey = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.darkGrey,
  );
}
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class CustomTextField extends StatelessWidget {
 final bool? filled;
  final Color? fillColor;
 final Color? borderColor;
 final Widget? prefixIcon;
 final Widget? suffixIcon;
 final String? hintText;
 final TextStyle? hintStyle;
final  String? labelText;
 final TextStyle? labelStyle;
 final String? errorText;
final  TextStyle? errorStyle;
 final String? Function(String?)? validator;
 final Function(String)? onChanged;
 final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.filled,
    this.fillColor,
     this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.errorText,
    this.errorStyle,  this.onChanged, this.validator, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: buildDecorationBorder(
          radius: 16.0,
          color: borderColor,
          side: 2.0,
        ),

        focusedBorder: buildDecorationBorder(
          radius: 16.0,
          color: borderColor,
          side: 2.0,
        ),
        errorBorder: buildDecorationBorder(
          radius: 16.0,
          color: AppColors.gold,
          side: 2.0,
        ),
        focusedErrorBorder: buildDecorationBorder(
          radius: 16.0,
          color: AppColors.gold,
          side: 2.0,
        ),
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        errorText: errorText,
        errorStyle: errorStyle,

      ),
      validator: validator,
      onChanged: onChanged,
      controller: controller,

    );
  }

  OutlineInputBorder buildDecorationBorder({
    required radius,
    required color,
    required side,

  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: side),
    );
  }
}

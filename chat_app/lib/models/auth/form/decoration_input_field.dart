import 'package:flutter/material.dart';
import 'package:chat_app/constant/theme.dart';

InputDecoration decorationInputFieldLogin({
  required String hintText,
  required String labelTeaxt,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    // styles
    // Normal enabled border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: primaryThemeText, width: 1.5),
    ),
    // Focused border
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: primaryThemeText, width: 2),
    ),
    // Error border
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: errorTheme, width: 1.5),
    ),
    // Focused error border
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: errorTheme, width: 2),
    ),

    suffixIconColor: primaryThemeText,

    // Label + hint colors
    labelStyle: TextStyle(color: primaryThemeText),
    hintStyle: TextStyle(color: primaryLightyThemeText),

    // Error label
    errorStyle: TextStyle(color: errorTheme),

    // props
    labelText: labelTeaxt,
    hintText: hintText,
    suffixIcon: suffixIcon,
  );
}

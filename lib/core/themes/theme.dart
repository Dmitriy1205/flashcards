import 'package:flutter/material.dart';

import '../const/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textSelectionTheme:
    TextSelectionThemeData(
        selectionColor: AppColors.mainAccent.withOpacity(0.25),
        cursorColor: AppColors.mainAccent),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color:Color(0xFF474D4C) ),
      prefixIconColor:const Color(0xFF474D4C)  ,
      focusColor: const Color(0xFF474D4C),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xFFEDEDED)
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.mainAccent,
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
    ),
    useMaterial3: true,
    fontFamily: 'OpenSans',
  );
}
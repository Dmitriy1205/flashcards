import 'package:flutter/material.dart';

import '../const/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.mainAccent.withOpacity(0.25),
        cursorColor: AppColors.mainAccent),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.mainAccent.withOpacity(0.1),
      hintStyle: const TextStyle(color: Color(0xFF474D4C)),
      prefixIconColor: const Color(0xFF474D4C),
      focusColor: const Color(0xFF474D4C),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFC8C8C8))),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1.5,
          color: AppColors.mainAccent,
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
    ),
    useMaterial3: true,
    fontFamily: 'OpenSans',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFF091312),
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF091312),
      ),
      titleLarge:TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 28,

        color: AppColors.mainAccent,
      ) ,
      titleMedium:TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,

        color: AppColors.mainAccent,
      ) ,
      titleSmall:TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xFF828282),
      ) ,
      labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xFF091312),
      ) ,
      labelSmall:TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.grey,
      ) ,
    ),
  );
}

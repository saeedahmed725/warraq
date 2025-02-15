import 'package:flutter/material.dart';
import 'package:warraq/core/constants/app_fonts.dart';

import '../../core/constants/app_color.dart';

class AppThemes {
  AppThemes._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.kPrimaryColor,
        surfaceTintColor: AppColor.kPrimaryColor,
        foregroundColor: AppColor.kPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(dragHandleColor: Colors.black),
    brightness: Brightness.light,
    primaryColor: AppColor.kPrimaryColor,
    fontFamily: AppFonts.noorFontFonts,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.kContainerLightColor,
      secondary: AppColor.kContainerLightColor,
      surface: AppColor.kContainerLightColor,
      // more light primary container
      primaryContainer: AppColor.kContainerLightColor,
      // secondaryContainer: AppColor.kSecondaryContainerLightColor,
      shadow: Colors.black12,
      error: Colors.red,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    textSelectionTheme: TextSelectionThemeData(
        // cursorColor: AppColor.kSecondaryHomeCardColor,
        selectionColor: AppColor.kPrimaryColor.withOpacity(0.2),
        selectionHandleColor: AppColor.kPrimaryColor),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // scaffoldBackgroundColor: AppColor.kScaffoldBackground,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.kPrimaryColor,
        surfaceTintColor: AppColor.kPrimaryColor,
        foregroundColor: AppColor.kPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(dragHandleColor: Colors.white),

    brightness: Brightness.dark,
    primaryColor: AppColor.kPrimaryColor,
    fontFamily: AppFonts.noorFontFonts,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.kContainerDarkColor,
      secondary: const Color(0xff2e2e2e),
      //const Color(0xff2e2e2e) Color(0xFF434343)
      surface: AppColor.kContainerDarkColor,
      error: Colors.red,
      shadow: Colors.black12,
      primaryContainer: AppColor.kContainerDarkColor,
      // secondaryContainer: AppColor.kSecondaryContainerDarkColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: AppColor.kPrimaryColor.withOpacity(0.2),
        selectionHandleColor: AppColor.kPrimaryColor),
  );
}

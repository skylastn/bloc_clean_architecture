import 'package:flutter/material.dart';

class FoodAppColorTheme {
  // Background
  static const LinearGradient background = FoodAppColorTheme.backgroundGradient;
  static const Color buttonBackground = Colors.white;

  // Accent
  static const Color primary = Color(0xFFFB6E3B);
  static const Color secondary = Colors.white;
  static const Color success = Colors.green;
  static const Color danger = Colors.red;
  static const Color warning = Colors.yellow;
  static const Color info = Colors.blue;

  // Text
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);

  // Anugerah
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF333333);
  static const Color lightGrey = Color(0xFF858592);
  static const Color lightGrey2 = Color(0xFFCDCDD2);
  static const Color lightGrey3 = Color(0xFFF2F2F4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFFB6E3B);
  static const Color lightOrange = Color(0xFFFCAC62);
  static const Color darkOrange = Color(0xFFFA551A);
  static const Color darkOrange2 = Color(0xFFFF8000);
  static const Color lightPeach = Color(0xFFFFF1EB);
  static const Color gold = Color(0xFFFDBC44);
  static const Color darkGold = Color(0xFFEF9B0F);
  static const Color lightGold = Color(0xFFFFEFD5);
  static const Color lightBrown = Color(0xFFE5AA70);
  static const Color lime = Color(0xFFE3DD48);
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      FoodAppColorTheme.primary,
      Color(0xFFFB973B),
    ],
  );
  static const Color lightTeal = Color(0xFF8CB9BD);
  static const Color turquoise = Color(0xFF5CB4D0);
  static const Color steelBlue = Color(0xFF5286C3);
  static const Color lightCyan = Color(0xFFD2F3FA);
  static const Color tan = Color(0xFFC79D89);
  static const Color darkTan = Color(0xFFAB7C65);
  static const Color lavender = Color(0xFFB08BBB);
  static const Color salmon = Color(0xFFE05D5D);
  static const Color crimson = Color(0xFFED2939);
  static const Color palePink = Color(0xFFFFDEEB);
  static const Color coralPink = Color(0xFFFF91A4);
  static const Color darkOrange3 = Color(0xFFFA501A);
  static const Color pink = Color(0xFFF75874);
  static const Color green = Color(0xFF00A550);
  static const Color lightGreen = Color(0xFFC9FFB0);
  static const Color mediumGreen = Color(0xFF99EA73);
  static const Color darkGreen = Color(0xFF7ABB45);
  static const Color paleGreen = Color(0xFFDCFFCB);
}

import 'package:flutter/material.dart';
import 'package:kiosk_bo/shared/theme/color_theme.dart';

import 'components/elevated_button_theme.dart';
import 'components/text_button_theme.dart';
import 'components/text_theme.dart';

class FoodAppTheme {
  FoodAppTheme._();

  static ThemeData getThemeData() {
    return ThemeData(
      // brightness: Brightness.light, // <- ini penting
      fontFamily: "Metropolis",
      appBarTheme: const AppBarTheme(
        backgroundColor: FoodAppColorTheme.primary,
        foregroundColor: FoodAppColorTheme.secondary,
      ),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.red,
      elevatedButtonTheme: FoodAppElevatedButtonThemeData(),
      textButtonTheme: FoodAppTextButtonThemeData(),
      textTheme: const FoodAppTextTheme(),
    );
  }
}

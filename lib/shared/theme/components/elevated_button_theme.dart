import 'package:flutter/material.dart';
import '../color_theme.dart';

class FoodAppElevatedButtonThemeData extends ElevatedButtonThemeData {
  FoodAppElevatedButtonThemeData({double? elevation = 0})
      : super(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              FoodAppColorTheme.buttonBackground,
            ),
            shape: WidgetStateProperty.all(
              const StadiumBorder(),
            ),
            elevation: WidgetStateProperty.all(elevation),
          ),
        );
}

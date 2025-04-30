import 'package:flutter/material.dart';

import '../color_theme.dart';

class FoodAppTextButtonThemeData extends TextButtonThemeData {
  FoodAppTextButtonThemeData({
    Color foregroundColor = FoodAppColorTheme.primary,
  }) : super(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              foregroundColor,
            ),
          ),
        );
}

import 'package:flutter/material.dart';

import '../../color_theme.dart';
import '../text_theme.dart';

class FoodAppInputDecoration extends InputDecoration {
  FoodAppInputDecoration(String label, IconData icon, Widget? suffixIcon)
    : super(
        labelText: label,
        labelStyle: FoodAppTextTheme.bodyRegular.copyWith(
          color: FoodAppColorTheme.lightGrey,
        ),
        hintText: label,
        hintStyle: FoodAppTextTheme.bodyRegular.copyWith(
          color: FoodAppColorTheme.lightGrey,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(icon, color: FoodAppColorTheme.primary),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      );
}

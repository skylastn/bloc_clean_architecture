import 'package:flutter/material.dart';

import '../color_theme.dart';

class FoodAppTextTheme extends TextTheme {
  static const String fontName = 'Roboto';

  const FoodAppTextTheme() : super();

  static const TextStyle captionMiniRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    color: Color(0xFF333333),
  );

  static const TextStyle captionMiniBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle captionSmallStrikeThrough = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    decoration: TextDecoration.lineThrough,
    color: Color(0xFF858592),
  );

  static const TextStyle captionSmallRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: Color(0xFF333333),
  );

  static const TextStyle captionSmallLight = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    color: Color(0xFF858592),
  );

  static const TextStyle captionSmallBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle captionBigRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF333333),
  );

  static const TextStyle captionBigUnderline = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    decoration: TextDecoration.underline,
    color: Color(0xFF333333),
  );

  static const TextStyle captionBigLight = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: Color(0xFF858592),
  );

  static const TextStyle captionBigBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle bodyRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    color: Color(0xFF333333),
  );

  static const TextStyle bodyUnderline = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    decoration: TextDecoration.underline,
    color: Color(0xFF333333),
  );

  static const TextStyle bodyBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle whiteBodyBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle bodyBigRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    color: Color(0xFF333333),
  );

  static const TextStyle bodyBigBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineSmallRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineSmallBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineMediumRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineMediumBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineMediumBoldWhite = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: FoodAppColorTheme.white,
  );

  static const TextStyle headlineBigRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 28,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineBigBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineVeryBigBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );

  static const TextStyle headlineVeryBigBoldWhite = TextStyle(
    fontFamily: 'Inter',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

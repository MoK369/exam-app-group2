import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xFFF9F9F9);
  static const Color gray = Color(0xFF535353);
  static const Color red = Color(0xFFCC1010);
  static const Color lightRed = Color(0xFFF8D2D2);
  static const Color green = Color(0xFF11CE19);
  static const Color lightGreen = Color(0xFFCAF9CC);
  static const Color placeHolderColor = Color(0xFFA6A6A6);
  static const Color lightBlue = Color(0xFFEDEFF3);

  static MaterialColor blue = const MaterialColor(0xFF02369C, {
    10: Color(0xFFccd7eb),
    20: Color(0xFFabbcde),
    30: Color(0xFF819bce),
    40: Color(0xFF5679bd),
    50: Color(0xFF2c58ad),
    60: Color(0xFF022d82),
    70: Color(0xFF012468),
    80: Color(0xFF011b4e),
    90: Color(0xFF011234),
    100: Color(0xFF000b1f),
  });

  static MaterialColor black = const MaterialColor(0xFF0f0f0f, {
    10: Color(0xFFcfcfcf),
    20: Color(0xFFafafaf),
    30: Color(0xFF878787),
    40: Color(0xFF5f5f5f),
    50: Color(0xFF373737),
    60: Color(0xFF0d0d0d),
    70: Color(0xFF0a0a0a),
    80: Color(0xFF080808),
    90: Color(0xFF050505),
    100: Color(0xFF030303),
  });
}

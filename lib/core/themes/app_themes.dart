import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Color blueAppColor = Color(0xFF02369C);
  static const Color grayAppColor = Color(0xFF878787);
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
    labelSmall: GoogleFonts.inter(color: Colors.black, fontSize: 12),
    labelMedium: GoogleFonts.inter(color: Colors.black, fontSize: 16),
    labelLarge: GoogleFonts.inter(color: Colors.black, fontSize: 20),
  ));
}

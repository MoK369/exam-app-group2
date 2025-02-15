import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Color blueAppColor = Color(0xFF02369C);
<<<<<<< Updated upstream
  static const Color grayAppColor = Color(0xFF878787);
=======
  static const Color grayAppColor30 = Color(0xFF878787);
  static const Color lightPrimaryColor = Color(0xFFF9F9F9);
  static const Color errorAppColor = Color(0xFFCC1010);
  static const Color verficationFieldColor = Color.fromRGBO(223, 231, 247, 1);

  static TextStyle styles18w500black15 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
 
    color: const Color.fromRGBO(15,15,15,1),
  );

    static TextStyle styles14w400grey = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
 
    color: const Color.fromRGBO(83,83,83,1),
  );

>>>>>>> Stashed changes
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
    labelSmall: GoogleFonts.inter(color: Colors.black, fontSize: 12),
    labelMedium: GoogleFonts.inter(color: Colors.black, fontSize: 16),
    labelLarge: GoogleFonts.inter(color: Colors.black, fontSize: 20),
  ));
}

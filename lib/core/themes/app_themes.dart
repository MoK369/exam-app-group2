import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color blueAppColor = Color(0xFF02369C);
  static const Color grayAppColor30 = Color(0xFF878787);
  static const Color lightPrimaryColor = Color(0xFFF9F9F9);
  static const Color errorAppColor = Color(0xFFCC1010);
  static const Color white = Colors.white;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: lightPrimaryColor,
    dialogBackgroundColor: lightPrimaryColor,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: blueAppColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimaryColor,
    ),
    textTheme: TextTheme(
      labelSmall: GoogleFonts.inter(
        color: Colors.black,
        fontSize: 12.sp,
      ),
      bodySmall: GoogleFonts.inter(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 13.sp,
      ),
      labelMedium: GoogleFonts.inter(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: GoogleFonts.inter(
        color: Colors.black,
        fontSize: 20.sp,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: const OutlineInputBorder(),
      hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xFFA6A6A6)),
      labelStyle: TextStyle(fontSize: 12.sp, color: const Color(0xFF535353)),
      errorMaxLines: 4,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: errorAppColor,
        ),
      ),
      errorStyle: TextStyle(
        color: errorAppColor,
        fontSize: 12.sp,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blueAppColor,
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 0.8,
      margin: EdgeInsets.symmetric(vertical: 8.h),
    ),
  );
}

import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static TextStyle styles18w500black15 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: const Color.fromRGBO(15, 15, 15, 1),
  );

  static TextStyle styles14w400grey = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color.fromRGBO(83, 83, 83, 1),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      labelSmall: GoogleFonts.inter(color: Colors.black, fontSize: 12.sp),
      labelMedium: GoogleFonts.inter(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
      labelLarge: GoogleFonts.inter(color: Colors.black, fontSize: 20.sp),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xFFA6A6A6)),
        labelStyle: TextStyle(fontSize: 12.sp, color: const Color(0xFF535353)),
        errorMaxLines: 4,
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red)),
        errorStyle: TextStyle(color: AppColors.red, fontSize: 12.sp)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.black[30],
        disabledForegroundColor: AppColors.white,
        textStyle:
            GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500),
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
        ),
      ),
    ),
  );
}

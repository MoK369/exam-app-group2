import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color blueAppColor = Color(0xFF02369C);
  static const Color grayAppColor30 = Color(0xFF878787);
  static const Color lightPrimaryColor = Color(0xFFF9F9F9);
  static const Color errorAppColor = Color(0xFFCC1010);
  static const Color darkGray = Color(0xFF535353);
  static const Color gray = Color(0xFFCFCFCF);
  static const Color lightBlue = Color(0xFFCCD7EB);
  static const Color moreLightBlue = Color(0xFFEDEFF3);
  static const Color white = Colors.white;
  static const Color green = Color(0xFF11CE19);

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    dialogBackgroundColor: AppColors.white,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.blue),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
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
      bodyLarge: GoogleFonts.inter(
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: darkGray,
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
          color: AppColors.red,
        ),
      ),
      errorStyle: TextStyle(
        color: AppColors.red,
        fontSize: 12.sp,
      ),
    ),
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
    checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.blue;
            } else {
              return AppColors.white;
            }
          },
        ),
        checkColor: const WidgetStatePropertyAll(AppColors.white)),
    navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.lightBlue,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                color: AppColors.blue,
                size: 24.r,
              );
            } else {
              return IconThemeData(color: AppColors.black[30], size: 24.r);
            }
          },
        ),
        indicatorColor: AppColors.blue[10],
        indicatorShape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(48)),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            Color? chooseColor = AppColors.black[30];
            if (states.contains(WidgetState.selected)) {
              chooseColor = AppColors.blue;
            }
            return GoogleFonts.roboto(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                height: 2.2,
                color: chooseColor);
          },
        )),
    cardTheme: CardTheme(
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 0.8,
      margin: EdgeInsets.symmetric(vertical: 8.h),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      tileColor: moreLightBlue,
      selectedTileColor: lightBlue,
      selectedColor: Colors.black,
    ),
  );
}

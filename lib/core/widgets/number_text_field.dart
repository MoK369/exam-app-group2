import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';

class NumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onNext;

  const NumberTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: AppThemes.verficationFieldColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppThemes.verficationFieldColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppThemes.verficationFieldColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: AppThemes.verficationFieldColor,
            width: 1.5,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 25.h),
      ),
      // style: Styles.styles17w500NormalBlack,
      focusNode: focusNode,
      textAlign: TextAlign.center, // Center the text
      onChanged: onNext,
    );
  }
}

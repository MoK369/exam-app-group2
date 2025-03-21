import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerOption extends StatelessWidget {
  final bool isMultiple;
  final bool isSelected;
  final bool isCorrect;
  final String answerText;

  const AnswerOption({
    super.key,
    required this.isMultiple,
    required this.isSelected,
    required this.isCorrect,
    required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected
              ? (isCorrect
                  ? AppColors.lightGreen
                  : AppColors.lightRed)
              : isCorrect
                  ? AppColors.lightGreen
                  : AppColors.lightBlue,
          border: Border.all(
            color: isSelected
                ? (isCorrect
                    ? AppColors.green
                    : AppColors.red)
                : isCorrect
                    ? AppColors.green
                    : AppColors.lightBlue,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Center(
                child: Icon(
                  isMultiple
                      ? (isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank)
                      : (isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked),
                  color: isSelected
                      ? (isCorrect
                          ? AppColors.green
                          : AppColors.red)
                      : AppColors.blue,
                  size: 24,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  answerText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.black,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

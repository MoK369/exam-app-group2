import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerOption extends StatelessWidget {
  final bool isMultiple;
  final bool isSelected;
  final bool isCorrect;
  final String answerText;

  const AnswerOption({
    Key? key,
    required this.isMultiple,
    required this.isSelected,
    required this.isCorrect,
    required this.answerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected
              ? (isCorrect
                  ? const Color.fromRGBO(202, 249, 204, 1)
                  : const Color.fromRGBO(248, 210, 210, 1))
              : const Color.fromRGBO(237, 239, 243, 1),
          border: Border.all(
            color: isSelected
                ? (isCorrect
                    ? const Color.fromRGBO(17, 206, 25, 1)
                    : const Color.fromRGBO(204, 16, 16, 1))
                : const Color.fromRGBO(237, 239, 243, 1),
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
                          ? const Color.fromRGBO(17, 206, 25, 1)
                          : const Color.fromRGBO(204, 16, 16, 1))
                      : const Color.fromRGBO(2, 54, 156, 1),
                  size: 24,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  answerText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromRGBO(15, 15, 15, 1),
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

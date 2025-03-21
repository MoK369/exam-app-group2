import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onActionTap;

  const CustomRichText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14.sp),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: InkWell(
              onTap: onActionTap,
              child: Text(
                actionText,
                style: Theme.of(context)
                    .textTheme.labelSmall!.copyWith(
                    color: AppColors.blue,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

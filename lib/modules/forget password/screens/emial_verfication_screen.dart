import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_rich_text.dart';
import 'package:exam_app_group2/core/widgets/verfication_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmialVerficationScreen extends StatefulWidget {
  const EmialVerficationScreen({super.key});

  @override
  State<EmialVerficationScreen> createState() => _EmialVerficationScreenState();
}

class _EmialVerficationScreenState extends State<EmialVerficationScreen> {
  final TextEditingController _verificationCodeController1 = TextEditingController();
  final TextEditingController _verificationCodeController2 = TextEditingController();
  final TextEditingController _verificationCodeController3 = TextEditingController();
  final TextEditingController _verificationCodeController4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Text(
                "Email verification",
                style: AppThemes.styles18w500black15,
              ),
            ),
            SizedBox(height: 14.h),
            Center(
              child: Text(
                "Please enter your code that send to your\nemail address ",
                style: AppThemes.styles14w400grey,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24.h),

            
            VerificationCodeRow(
              controllers: [
                _verificationCodeController1,
                _verificationCodeController2,
                _verificationCodeController3,
                _verificationCodeController4,
              ],
              focusNodes: [
                _focusNode1,
                _focusNode2,
                _focusNode3,
                _focusNode4,
              ],
            ),

            SizedBox(height: 25.h),
            CustomRichText(
              text: "Didn't receive code?",
              actionText: "Resend",
              onActionTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

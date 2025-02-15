import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Password"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text(
                    "Reset password",
                    style: AppThemes.styles18w500black15,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Center(
                  child: Text(
                    "Password must not be empty and must contain\n6 characters with upper case letter and one \nnumber at least ",
                    style: AppThemes.styles14w400grey,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  controller: newPassword ,
                  validator: (inputText)
                  {
                      return ValidateFunctions.validationOfPassword(inputText);
        
                  } ,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                            labelText: "New password",
                            hintText: "Enter you password",
                          ),
        
        
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: confirmPassword ,
                  validator: (inputText)
                  {
                      return ValidateFunctions.validationOfConfirmPassword(inputText , newPassword);
        
                  } ,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                            labelText: "Confirm password",
                            hintText: "Confirm password",
                          ),
        
        
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  width: 400.w,
                  child: CustomElevatedButton(
                    onTap: (){},
                    text: "Continue",
                  ),
                ),

        
          ],
        ),
      ) ,
    );
  }
}
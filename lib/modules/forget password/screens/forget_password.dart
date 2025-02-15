import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        
        appBar: const CustomAppBar(title: "Password"),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Forget password",
                style: AppThemes.styles18w500black15,
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                "Please enter your email associated to\nyour account",
                style: AppThemes.styles14w400grey,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
                TextFormField(
                        controller: emailController,
                        validator: (inputText) {
                          return ValidateFunctions.validationOfEmail(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                        ),
                      ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 400.w,
                child: CustomElevatedButton(onTap: onContinueClick, text: "Continue",))
      
                
            ],
          ),
        ),
      ),
    );
  }

   void onContinueClick() {
    FocusManager.instance.primaryFocus?.unfocus();
          Navigator.pushNamed(context, DefinedRoutes.emailVerficationName);
    if (formKey.currentState?.validate() == true) {
      Navigator.pushNamed(context, DefinedRoutes.emailVerficationName);
    }
  }
}
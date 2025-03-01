import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_button.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/forget_password_cubit.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordCubit forgotPasswordCubit = getIt<ForgotPasswordCubit>() ;
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        
        appBar:  CustomAppBar(title: "Password"),
        body: BlocProvider(create: (context)=> forgotPasswordCubit , 
        child: BlocConsumer<ForgotPasswordCubit , ForgotPasswordState>(builder: (context ,state)
        {
          return          SingleChildScrollView(
            child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                CustomElevatedButton(onTap: onContinueClick, text: "Continue",)
                  
                  
              ],
            ),
                    ),
          );

        }, listener: (context ,state)
        {
          if(state.isError)
          {
            showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      state.apiErrorModel?.message ?? '',
                    ),
                  ),
                );
          } else if (state.isSuccess)
          {
             Navigator.pushReplacementNamed(
                  context,
                  DefinedRoutes.emailVerficationName,
                  arguments: emailController.text,
                );
          }
        }),
        )

      ),
    );
  }

void onContinueClick() {
  FocusManager.instance.primaryFocus?.unfocus();
  print("onclick");
      forgotPasswordCubit.doIntent(
      OnForgotPasswordButtonClicked(email: emailController.text),
    );

  if (formKey.currentState?.validate() == true) {
    forgotPasswordCubit.doIntent(
      OnForgotPasswordButtonClicked(email: emailController.text),
    );
  }
}

}
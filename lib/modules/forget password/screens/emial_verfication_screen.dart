import 'dart:math';

import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_rich_text.dart';
import 'package:exam_app_group2/core/widgets/verfication_row.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/forget_password_cubit.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/verfy%20code%20cubit/verfy_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmialVerficationScreen extends StatefulWidget {
  final String email ; 
  const EmialVerficationScreen({super.key , required this.email});

  @override
  State<EmialVerficationScreen> createState() => _EmialVerficationScreenState();
}

class _EmialVerficationScreenState extends State<EmialVerficationScreen> {
  
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  final VerfyCodeCubit verfyCodeCubit = getIt<VerfyCodeCubit>();
  final ForgotPasswordCubit forgotPasswordCubit = getIt<ForgotPasswordCubit>();

 


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => verfyCodeCubit),
        BlocProvider(create: (context) => forgotPasswordCubit),
      ],
      child: Builder( 
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(title: "Password"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      "Please enter your code that was sent to your\nemail address",
                      style: AppThemes.styles14w400grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  
                  VerificationCodeRow(
                    controllers: _controllers,
                    focusNodes: _focusNodes,
                    email: widget.email,
                    onCompleted: () {
                      context.read<VerfyCodeCubit>().submitCode(_controllers); 
                    },
                  ),

                  SizedBox(height: 25.h),
                  Center(
                    child: CustomRichText(
                      text: "Didn't receive code?",
                      actionText: "Resend",
                      onActionTap: () {
                        context.read<ForgotPasswordCubit>().doIntent(
                          OnForgotPasswordButtonClicked(email: widget.email), 
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

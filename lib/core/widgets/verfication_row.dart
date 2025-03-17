import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'number_text_field.dart';

class VerificationCodeRow extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final VoidCallback onCompleted;

  const VerificationCodeRow({
    Key? key,
    required this.controllers,
    required this.focusNodes,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controllers.length, (index) {
        return Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: TextFormField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  if (index < controllers.length - 1) {
                    focusNodes[index + 1].requestFocus();
                  }
                  if (index == controllers.length - 1) {
                    bool allFilled =
                        controllers.every((c) => c.text.length == 1);
                    if (allFilled) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onCompleted();
                    }
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.verificationFieldColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              )

              // NumberTextField(
              //   controller: controllers[index],
              //   focusNode: focusNodes[index],
              //   onNext: index < controllers.length - 1
              //       ? () =>
              //           FocusScope.of(context).requestFocus(focusNodes[index + 1])
              //       : onCompleted,
              //   onChanged: (value) {
              //     if (value.isNotEmpty && index < controllers.length - 1) {
              //       FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              //     }
              //
              //     bool allFilled = controllers.every((c) => c.text.length == 1);
              //     if (allFilled) {
              //       onCompleted();
              //       // Navigator.pushReplacementNamed(
              //       //   context,
              //       //   DefinedRoutes.confirmPasswordName,
              //       // );
              //       forgetPasswordScreenPageController.jumpToPage(2);
              //     }
              //   },
              // ),
              ),
        );
      }),
    );
  }
}

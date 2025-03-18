import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationCodeRow extends StatefulWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final VoidCallback onCompleted;

  final GlobalKey<FormState> formKey;

  final bool isSendCodeInvalid;

  const VerificationCodeRow(
      {super.key,
      required this.controllers,
      required this.focusNodes,
      required this.onCompleted,
      required this.formKey,
      required this.isSendCodeInvalid});

  @override
  State<VerificationCodeRow> createState() => _VerificationCodeRowState();
}

class _VerificationCodeRowState extends State<VerificationCodeRow> {
  @override
  void didUpdateWidget(covariant VerificationCodeRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSendCodeInvalid != widget.isSendCodeInvalid) {
      widget.formKey.currentState!.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.controllers.length, (index) {
          return Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  controller: widget.controllers[index],
                  focusNode: widget.focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (index < widget.controllers.length - 1 &&
                        value.length == 1) {
                      widget.focusNodes[index + 1].requestFocus();
                    }
                    if (value.isEmpty && index > 0) {
                      widget.focusNodes[index - 1].requestFocus();
                    }
                    if (index == widget.controllers.length - 1) {
                      bool allFilled =
                          widget.controllers.every((c) => c.text.length == 1);
                      if (allFilled) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        widget.onCompleted();
                      }
                    }
                  },
                  validator: (value) {
                    if (widget.isSendCodeInvalid) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.verificationFieldColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: AppColors.red)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                )),
          );
        }),
      ),
    );
  }
}

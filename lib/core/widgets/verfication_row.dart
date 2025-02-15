import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'number_text_field.dart';

class VerificationCodeRow extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  const VerificationCodeRow({
    Key? key,
    required this.controllers,
    required this.focusNodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controllers.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: NumberTextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              onNext: index < controllers.length - 1
                  ? () => FocusScope.of(context).requestFocus(focusNodes[index + 1])
                  : () {}, 
            ),
          ),
        );
      }),
    );
  }
}

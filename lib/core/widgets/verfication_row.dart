import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'number_text_field.dart';

class VerificationCodeRow extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final VoidCallback onCompleted;
  final String email ;

  const VerificationCodeRow({
    Key? key,
    required this.controllers,
    required this.focusNodes,
    required this.onCompleted,
    required this.email , 
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
                  : onCompleted, 
              onChanged: (value)
              {
                if(value.isNotEmpty  && index < controllers.length -1 )
                {
                  FocusScope.of(context).requestFocus(focusNodes[index+1]);
                }

                bool allFilled = controllers.every((c)=> c.text.length == 1 ) ;
                if(allFilled)
                {
                  onCompleted();
                   Navigator.pushReplacementNamed(
                  context,
                  DefinedRoutes.confirmPasswordName,
                  arguments: email
                  
                );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}

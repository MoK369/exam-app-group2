import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: "Sign Up"),
        body: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "User name",
                      hintText: "Enter your user name",
                    ),
                  ),
                  RPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "First name",
                              hintText: "Enter first name",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Last name",
                              hintText: "Enter last name",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                  ),
                  RPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "Enter password",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Confirm password",
                              hintText: "Confirm password",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Phone number",
                      hintText: "Enter phone number",
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Signup",
                        style: theme.textTheme.labelMedium!
                            .copyWith(color: Colors.white),
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account? ",
                          style: theme.textTheme.labelSmall!
                              .copyWith(fontSize: 14.sp)),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Login",
                                style: theme.textTheme.labelSmall!.copyWith(
                                  color: AppThemes.blueAppColor,
                                  fontSize: 14.sp,
                                ),
                              )))
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController userNameController = TextEditingController(),
      firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController(),
      phoneNumberController = TextEditingController();

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
                    controller: userNameController,
                    validator: (inputText) {
                      return ValidateFunctions.validationOfUserName(inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            controller: firstNameController,
                            validator: (inputText) {
                              return ValidateFunctions
                                  .validationOfFirstOrLastName(inputText);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            controller: lastNameController,
                            validator: (inputText) {
                              return ValidateFunctions
                                  .validationOfFirstOrLastName(inputText,
                                      isFirstName: false);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                  RPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            validator: (inputText) {
                              return ValidateFunctions.validationOfPassword(
                                  inputText);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            controller: confirmPasswordController,
                            validator: (inputText) {
                              return ValidateFunctions
                                  .validationOfConfirmPassword(
                                      inputText, passwordController);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                    controller: phoneNumberController,
                    validator: (inputText) {
                      return ValidateFunctions.validationOfPhoneNumber(
                          inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Phone number",
                      hintText: "Enter phone number",
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        onSignUpButtonClick();
                      },
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

  void onSignUpButtonClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.validate() == true) {}
  }
}

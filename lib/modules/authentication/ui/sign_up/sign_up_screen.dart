import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';
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
        appBar: CustomAppBar(title: appLocalizations.signUp),
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
                    decoration: InputDecoration(
                      labelText: appLocalizations.userName,
                      hintText: appLocalizations.enterUserName,
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
                            decoration: InputDecoration(
                              labelText: appLocalizations.firstName,
                              hintText: appLocalizations.enterFirstName,
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
                            decoration: InputDecoration(
                              labelText: appLocalizations.lastName,
                              hintText: appLocalizations.enterLastName,
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
                    decoration: InputDecoration(
                      labelText: appLocalizations.email,
                      hintText: appLocalizations.enterYourEmail,
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
                            decoration: InputDecoration(
                              labelText: appLocalizations.password,
                              hintText: appLocalizations.enterPassword,
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
                            decoration: InputDecoration(
                              labelText: appLocalizations.confirmPassword,
                              hintText: appLocalizations.confirmPassword,
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
                    decoration: InputDecoration(
                      labelText: appLocalizations.phoneNumber,
                      hintText: appLocalizations.enterPhoneNumber,
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
                        appLocalizations.signUp,
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
                          text: appLocalizations.alreadyHaveAccount,
                          style: theme.textTheme.labelSmall!
                              .copyWith(fontSize: 14.sp)),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: InkWell(
                              onTap: () {},
                              child: Text(
                                appLocalizations.login,
                                style: theme.textTheme.labelSmall!.copyWith(
                                  color: AppThemes.blueAppColor,
                                  fontSize: 14.sp,
                                ),
                              )))
                    ])),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => localizationUseCase
                              .changeLocale(LanguagesCodes.english),
                          child: Text(
                            "English",
                            style: theme.textTheme.labelMedium!
                                .copyWith(color: Colors.white),
                          )),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () => localizationUseCase
                              .changeLocale(LanguagesCodes.arabic),
                          child: Text(
                            "العربية",
                            style: theme.textTheme.labelMedium!
                                .copyWith(color: Colors.white),
                          )),
                    ],
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

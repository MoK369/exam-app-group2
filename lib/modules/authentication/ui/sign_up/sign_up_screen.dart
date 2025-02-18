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
  bool isPasswordObscure = true, isConfirmPasswordObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  final String userName = "UserName",
      firstName = "FirstName",
      lastName = "LastName",
      email = "Email",
      password = "Password",
      confirmPassword = "ConfirmPassword",
      phoneNumber = "PhoneNumber";

  late final Map<String, TextEditingController> signUpFieldsControllers;
  late final Map<String, FocusNode> signUpFieldsFocusNodes;
  final FocusNode userNameFocusNode = FocusNode(),
      firstNameFocusNode = FocusNode(),
      lastNameFocusNode = FocusNode(),
      emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode(),
      phoneNumberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    signUpFieldsControllers = {
      userName: TextEditingController(),
      firstName: TextEditingController(),
      lastName: TextEditingController(),
      email: TextEditingController(),
      password: TextEditingController(),
      confirmPassword: TextEditingController(),
      phoneNumber: TextEditingController()
    };
    signUpFieldsFocusNodes = {
      userName: FocusNode(),
      firstName: FocusNode(),
      lastName: FocusNode(),
      email: FocusNode(),
      password: FocusNode(),
      confirmPassword: FocusNode(),
      phoneNumber: FocusNode()
    };
  }

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
                    controller: signUpFieldsControllers[userName],
                    validator: (inputText) {
                      return ValidateFunctions.validationOfUserName(inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    focusNode: userNameFocusNode,
                    onFieldSubmitted: (value) =>
                        firstNameFocusNode.requestFocus(),
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
                            controller: signUpFieldsControllers[firstName],
                            validator: (inputText) {
                              return ValidateFunctions
                                  .validationOfFirstOrLastName(inputText);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            focusNode: firstNameFocusNode,
                            onFieldSubmitted: (value) =>
                                lastNameFocusNode.requestFocus(),
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
                            controller: signUpFieldsControllers[lastName],
                            validator: (inputText) {
                              return ValidateFunctions
                                  .validationOfFirstOrLastName(inputText,
                                      isFirstName: false);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            focusNode: lastNameFocusNode,
                            onFieldSubmitted: (value) =>
                                emailFocusNode.requestFocus(),
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
                    controller: signUpFieldsControllers[email],
                    validator: (inputText) {
                      return ValidateFunctions.validationOfEmail(inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    onFieldSubmitted: (value) =>
                        passwordFocusNode.requestFocus(),
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
                            controller: signUpFieldsControllers[password],
                            validator: (inputText) {
                              return ValidateFunctions.validationOfPassword(
                                  inputText);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isPasswordObscure,
                            obscuringCharacter: "*",
                            focusNode: passwordFocusNode,
                            onFieldSubmitted: (value) =>
                                confirmPasswordFocusNode.requestFocus(),
                            decoration: InputDecoration(
                                labelText: appLocalizations.password,
                                hintText: appLocalizations.enterPassword,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      onPasswordVisibilityIconClick();
                                    },
                                    icon: Icon(isPasswordObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                          ),
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller:
                                signUpFieldsControllers[confirmPassword],
                            validator: (inputText) {
                              return ValidateFunctions
                                  .validationOfConfirmPassword(inputText,
                                      signUpFieldsControllers[password]!);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isConfirmPasswordObscure,
                            obscuringCharacter: "*",
                            focusNode: confirmPasswordFocusNode,
                            onFieldSubmitted: (value) =>
                                phoneNumberFocusNode.requestFocus(),
                            decoration: InputDecoration(
                                labelText: appLocalizations.confirmPassword,
                                hintText: appLocalizations.confirmPassword,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      onConfirmPasswordVisibilityIconClick();
                                    },
                                    icon: Icon(isConfirmPasswordObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: signUpFieldsControllers[phoneNumber],
                    validator: (inputText) {
                      return ValidateFunctions.validationOfPhoneNumber(
                          inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    focusNode: phoneNumberFocusNode,
                    onFieldSubmitted: (value) => phoneNumberFocusNode.unfocus(),
                    decoration: InputDecoration(
                      labelText: appLocalizations.phoneNumber,
                      hintText: appLocalizations.enterPhoneNumber,
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  ElevatedButton(
                      onPressed: () => onSignUpButtonClick(),
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

  void onPasswordVisibilityIconClick() {
    setState(() {
      isPasswordObscure = !isPasswordObscure;
    });
  }

  void onConfirmPasswordVisibilityIconClick() {
    setState(() {
      isConfirmPasswordObscure = !isConfirmPasswordObscure;
    });
  }

  @override
  void dispose() {
    super.dispose();
    signUpFieldsControllers.forEach(
      (key, controller) => controller.dispose(),
    );
    signUpFieldsFocusNodes.forEach(
      (key, focusNode) => focusNode.dispose,
    );
  }
}

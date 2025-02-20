import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/constants/sign_up_fields_names.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/view_model/sign_up_state.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen> {
  bool isPasswordObscure = true, isConfirmPasswordObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  late final Map<String, TextEditingController> signUpFieldsControllers;
  late final Map<String, FocusNode> signUpFieldsFocusNodes;
  final FocusNode userNameFocusNode = FocusNode(),
      firstNameFocusNode = FocusNode(),
      lastNameFocusNode = FocusNode(),
      emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode(),
      phoneNumberFocusNode = FocusNode();
  final SignUpViewModel signUpViewModel = getIt.get<SignUpViewModel>();

  @override
  void initState() {
    super.initState();
    signUpFieldsControllers = {
      SignUpFieldsKeys.userName: TextEditingController(),
      SignUpFieldsKeys.firstName: TextEditingController(),
      SignUpFieldsKeys.lastName: TextEditingController(),
      SignUpFieldsKeys.email: TextEditingController(),
      SignUpFieldsKeys.password: TextEditingController(),
      SignUpFieldsKeys.confirmPassword: TextEditingController(),
      SignUpFieldsKeys.phoneNumber: TextEditingController()
    };
    signUpFieldsFocusNodes = {
      SignUpFieldsKeys.userName: FocusNode(),
      SignUpFieldsKeys.firstName: FocusNode(),
      SignUpFieldsKeys.lastName: FocusNode(),
      SignUpFieldsKeys.email: FocusNode(),
      SignUpFieldsKeys.password: FocusNode(),
      SignUpFieldsKeys.confirmPassword: FocusNode(),
      SignUpFieldsKeys.phoneNumber: FocusNode()
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpViewModel,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocListener<SignUpViewModel, SignUpState>(
          listenWhen: (previous, current) {
            if (current.signUpStatus == SignUpStatus.initial) return false;
            return true;
          },
          listener: (context, signUpState) {
            switch (signUpState.signUpStatus) {
              case SignUpStatus.loading:
                displayAlertDialog(title: const LoadingStateWidget());
              case SignUpStatus.success:
                displayAlertDialog(
                    title: Text(
                  "Successfully Registered!",
                  style: theme.textTheme.labelMedium,
                ));
              case SignUpStatus.error:
                displayAlertDialog(
                    title: Text(
                  signUpState.signUpErrorMessage!,
                  style: theme.textTheme.labelMedium,
                ));
              default:
                const Placeholder();
            }
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
                        controller:
                            signUpFieldsControllers[SignUpFieldsKeys.userName],
                        validator: (inputText) {
                          return ValidateFunctions.validationOfUserName(
                              inputText);
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
                                controller: signUpFieldsControllers[
                                    SignUpFieldsKeys.firstName],
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
                                controller: signUpFieldsControllers[
                                    SignUpFieldsKeys.lastName],
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
                        controller:
                            signUpFieldsControllers[SignUpFieldsKeys.email],
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
                                controller: signUpFieldsControllers[
                                    SignUpFieldsKeys.password],
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
                                controller: signUpFieldsControllers[
                                    SignUpFieldsKeys.confirmPassword],
                                validator: (inputText) {
                                  return ValidateFunctions
                                      .validationOfConfirmPassword(
                                          inputText,
                                          signUpFieldsControllers[
                                              SignUpFieldsKeys.password]!);
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
                        controller: signUpFieldsControllers[
                            SignUpFieldsKeys.phoneNumber],
                        validator: (inputText) {
                          return ValidateFunctions.validationOfPhoneNumber(
                              inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        focusNode: phoneNumberFocusNode,
                        onFieldSubmitted: (value) =>
                            phoneNumberFocusNode.unfocus(),
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
        ),
      ),
    );
  }

  void onSignUpButtonClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.validate() == true) {
      signUpViewModel.signUp(
          signUpParameters: SignUpRequestParameters(
        username: signUpFieldsControllers[SignUpFieldsKeys.userName]?.text,
        firstName: signUpFieldsControllers[SignUpFieldsKeys.firstName]?.text,
        lastName: signUpFieldsControllers[SignUpFieldsKeys.lastName]?.text,
        email: signUpFieldsControllers[SignUpFieldsKeys.email]?.text,
        password: signUpFieldsControllers[SignUpFieldsKeys.password]?.text,
        rePassword:
            signUpFieldsControllers[SignUpFieldsKeys.confirmPassword]?.text,
        phone: signUpFieldsControllers[SignUpFieldsKeys.phoneNumber]?.text,
      ));
    }
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

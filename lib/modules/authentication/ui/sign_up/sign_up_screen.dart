import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/constants/emojis/emojis.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/view_model/sign_up_state.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/view_model/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injectable_initializer.dart';

class SignUpScreen extends StatefulWidget {
  static const String widgetName = "SignUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen> {
  final SignUpViewModel signUpViewModel = getIt.get<SignUpViewModel>();
  late ValidateFunctions validateFunctions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpViewModel,
      child: GestureDetector(
        onTap: () => signUpViewModel.getKeyboardUnfocused(),
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
                hideAlertDialog();
                displayAlertDialog(
                    showOkButton: true,
                    onOkButtonClick: () {
                      hideAlertDialog();
                      hideAlertDialog();
                    },
                    title: Text(
                      appLocalizations.successfullyRegistered,
                      style: theme.textTheme.labelMedium,
                    ));
              case SignUpStatus.error:
                hideAlertDialog();
                displayAlertDialog(
                    showOkButton: true,
                    title: ErrorStateWidget(error: signUpState.signUpError!));
              case SignUpStatus.initial:
                break;
            }
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: appLocalizations.signUp,
              showLocaleButton: true,
              widgetNameForErrorNotifier: SignUpScreen.widgetName,
              onChangeLocaleButtonClick: () {
                if (signUpViewModel.state.signUpFormStatus ==
                    SignUpFormStatus.unValid) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      signUpViewModel.validateForm();
                    },
                  );
                }
              },
            ),
            body: RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: SingleChildScrollView(
                child: Form(
                  key: signUpViewModel.formKey,
                  onChanged: signUpViewModel.validateForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      TextFormField(
                        controller: signUpViewModel.userNameController,
                        //signUpFieldsControllers[SignUpFieldsKeys.userName],
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfUserName(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        focusNode: signUpViewModel.userNameFocusNode,
                        //signUpFieldsFocusNodes[SignUpFieldsKeys.userName],
                        onFieldSubmitted: (value) =>
                            signUpViewModel.firstNameFocusNode.requestFocus(),
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
                                controller: signUpViewModel.firstNameController,
                                validator: (inputText) {
                                  return validateFunctions
                                      .validationOfFirstOrLastName(inputText);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.name,
                                focusNode: signUpViewModel.firstNameFocusNode,
                                onFieldSubmitted: (value) => signUpViewModel
                                    .lastNameFocusNode
                                    .requestFocus(),
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
                                controller: signUpViewModel.lastNameController,
                                validator: (inputText) {
                                  return validateFunctions
                                      .validationOfFirstOrLastName(inputText,
                                          isFirstName: false);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.name,
                                focusNode: signUpViewModel.lastNameFocusNode,
                                onFieldSubmitted: (value) => signUpViewModel
                                    .emailFocusNode
                                    .requestFocus(),
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
                        controller: signUpViewModel.emailController,
                        validator: (inputText) {
                          return validateFunctions.validationOfEmail(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: signUpViewModel.emailFocusNode,
                        onFieldSubmitted: (value) =>
                            signUpViewModel.passwordFocusNode.requestFocus(),
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
                                controller: signUpViewModel.passwordController,
                                validator: (inputText) {
                                  return validateFunctions
                                      .validationOfPassword(inputText);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: signUpViewModel.isPasswordObscure,
                                obscuringCharacter: Emojis.star,
                                focusNode: signUpViewModel.passwordFocusNode,
                                onFieldSubmitted: (value) => signUpViewModel
                                    .confirmPasswordFocusNode
                                    .requestFocus(),
                                decoration: InputDecoration(
                                    labelText: appLocalizations.password,
                                    hintText: appLocalizations.enterPassword,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            signUpViewModel
                                                .onPasswordVisibilityIconClick();
                                          });
                                        },
                                        icon: Icon(
                                            signUpViewModel.isPasswordObscure
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
                                    signUpViewModel.confirmPasswordController,
                                validator: (inputText) {
                                  return validateFunctions
                                      .validationOfConfirmPassword(inputText,
                                          signUpViewModel.passwordController);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:
                                    signUpViewModel.isConfirmPasswordObscure,
                                obscuringCharacter: Emojis.star,
                                focusNode:
                                    signUpViewModel.confirmPasswordFocusNode,
                                onFieldSubmitted: (value) => signUpViewModel
                                    .phoneNumberFocusNode
                                    .requestFocus(),
                                decoration: InputDecoration(
                                    labelText: appLocalizations.confirmPassword,
                                    hintText: appLocalizations.confirmPassword,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            signUpViewModel
                                                .onConfirmPasswordVisibilityIconClick();
                                          });
                                        },
                                        icon: Icon(signUpViewModel
                                                .isConfirmPasswordObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: signUpViewModel.phoneNumberController,
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfPhoneNumber(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        focusNode: signUpViewModel.phoneNumberFocusNode,
                        onFieldSubmitted: (value) =>
                            signUpViewModel.phoneNumberFocusNode.unfocus(),
                        decoration: InputDecoration(
                          labelText: appLocalizations.phoneNumber,
                          hintText: appLocalizations.enterPhoneNumber,
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      BlocSelector<SignUpViewModel, SignUpState,
                          SignUpFormStatus>(
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed: state == SignUpFormStatus.unValid
                                  ? null
                                  : () => signUpViewModel.onSignUpButtonClick(),
                              child: Text(
                                appLocalizations.signUp,
                              ));
                        },
                        selector: (SignUpState state) {
                          return state.signUpFormStatus;
                        },
                      ),
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
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    appLocalizations.login,
                                    style: theme.textTheme.labelSmall!.copyWith(
                                      color: AppColors.blue,
                                      fontSize: 14.sp,
                                    ),
                                  )))
                        ])),
                      ),
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

  @override
  void dispose() {
    super.dispose();
    signUpViewModel.disposeControllersAndFocusNodes();
  }
}

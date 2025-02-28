import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/modules/authentication/ui/login/view_model/login_view_model.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/validation/validation_functions.dart';
import '../../../../../core/widgets/underline_text.dart';
import '../../../data/models/login/login_request.dart';
import '../../../domain/entities/authentication/authentication_response_entity.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseStatefulWidgetState<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final FocusNode emailFocusNode = FocusNode(), passwordFocusNode = FocusNode();

  bool rememberMe = false;
  late ValidateFunctions validateFunctions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  LoginViewModel loginViewModel = getIt<LoginViewModel>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: appLocalizations.login,
          showLocaleButton: true,
          onChangeLocaleButtonClick: () {
            if (loginViewModel.state.isUnValid) {
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  loginViewModel.doIntent(ValidateForm());
                },
              );
            }
          },
        ),
        body: BlocProvider(
          create: (context) => loginViewModel,
          child: BlocListener<LoginViewModel, LoginState>(
              listener: (context, state) {
                switch (state.state) {
                  case LoginStatus.initial:
                    break;
                  case LoginStatus.loading:
                    displayAlertDialog(title: const LoadingStateWidget());
                  case LoginStatus.success:
                    hideAlertDialog();
                    AuthenticationResponseEntity authEntity =
                        state.authEntity ?? AuthenticationResponseEntity();
                    if (!rememberMe) loginViewModel.doIntent(DeleteLoginInfo());
                    Navigator.pushNamedAndRemoveUntil(
                        context, DefinedRoutes.homeRouteName, (route) => false,
                        arguments: HomeScreenParameters(
                            authEntity: authEntity, rememberMe: rememberMe));
                  case LoginStatus.error:
                    hideAlertDialog();
                    displayAlertDialog(
                        showOkButton: true,
                        title: ErrorStateWidget(error: state.error!));
                }
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Form(
                    key: loginViewModel.formKey,
                    onChanged: () {
                      loginViewModel.doIntent(
                        ValidateForm(),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 6.h,
                        ),
                        TextFormField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          validator: (inputText) {
                            return validateFunctions
                                .validationOfEmail(inputText);
                          },
                          onFieldSubmitted: (value) =>
                              passwordFocusNode.requestFocus(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: appLocalizations.email,
                            hintText: appLocalizations.enterYourEmail,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        TextFormField(
                          focusNode: passwordFocusNode,
                          obscureText: obscurePassword,
                          controller: passwordController,
                          validator: (inputText) {
                            return validateFunctions
                                .validationOfPassword(inputText);
                          },
                          onFieldSubmitted: (value) =>
                              passwordFocusNode.unfocus(),
                          keyboardType: TextInputType.visiblePassword,
                          obscuringCharacter: '*',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: appLocalizations.password,
                            hintText: appLocalizations.enterPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  rememberMe = val ?? rememberMe;
                                });
                              },
                            ),
                            Text(appLocalizations.rememberMe,
                                style: theme.textTheme.bodySmall),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: UnderlineText(
                                child: Text(appLocalizations.forgetPassword,
                                    style: theme.textTheme.bodySmall),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        BlocSelector<LoginViewModel, LoginState,
                            LoginFormStatus>(
                          builder: (context, state) {
                            return ElevatedButton(
                                onPressed: state == LoginFormStatus.unValid
                                    ? null
                                    : () => loginViewModel.doIntent(
                                          OnLoginButtonClicked(
                                            loginRequest: LoginRequest(
                                              password: passwordController.text,
                                              email: emailController.text,
                                            ),
                                          ),
                                        ),
                                child: Text(
                                  appLocalizations.login,
                                ));
                          },
                          selector: (LoginState state) {
                            return state.loginFormStatus;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: appLocalizations.doNotHaveAccount,
                              style: theme.textTheme.labelSmall!.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          DefinedRoutes.signUpRouteName);
                                    },
                                    child: Text(
                                      appLocalizations.signUp,
                                      style:
                                          theme.textTheme.labelSmall!.copyWith(
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
              )),
        ),
      ),
    );
  }
}

import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_widget.dart';
import 'package:exam_app_group2/modules/authentication/ui/login/view_model/login_cubit.dart';
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

  LoginCubit cubit = getIt<LoginCubit>();
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
            if (cubit.state.isUnValid) {
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  cubit.doIntent(ValidateForm());
                },
              );
            }
          },
        ),
        body: BlocProvider(
          create: (context) => cubit,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.isError) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: ErrorStateWidget(
                      error: state.error!,
                    ),
                  ),
                );
              } else if (state.isSuccess) {
                AuthenticationResponseEntity authEntity =
                    state.authEntity ?? AuthenticationResponseEntity();
                if (!rememberMe) cubit.doIntent(DeleteLoginInfo());
                Navigator.pushNamedAndRemoveUntil(
                    context, DefinedRoutes.homeRouteName, (route) => false,
                    arguments: HomeScreenParameters(
                        authEntity: authEntity, rememberMe: rememberMe));
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Form(
                    key: cubit.formKey,
                    onChanged: () {
                      cubit.doIntent(
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
                          controller: emailController,
                          validator: (inputText) {
                            return validateFunctions
                                .validationOfEmail(inputText);
                          },
                          onFieldSubmitted: (value) =>
                              emailFocusNode.requestFocus(),
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
                          obscureText: obscurePassword,
                          controller: passwordController,
                          validator: (inputText) {
                            return validateFunctions
                                .validationOfPassword(inputText);
                          },
                          onFieldSubmitted: (value) =>
                              passwordFocusNode.requestFocus(),
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
                              activeColor: AppThemes.blueAppColor,
                              checkColor: Colors.white,
                            ),
                            Text(
                              appLocalizations.rememberMe,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: UnderlineText(
                                child: Text(appLocalizations.forgetPassword,
                                    style: Theme.of(context).textTheme.bodySmall
                                    // ?.copyWith(
                                    //   decoration: TextDecoration.underline,
                                    //   decorationThickness: 1.2
                                    // ),
                                    ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (!cubit.formKey.currentState!.validate()) return;
                            FocusManager.instance.primaryFocus?.unfocus();

                            cubit.doIntent(
                              OnLoginButtonClicked(
                                loginRequest: LoginRequest(
                                  password: passwordController.text,
                                  email: emailController.text,
                                ),
                              ),
                            );
                          },
                          child: !state.isLoading
                              ? Text(
                                  appLocalizations.login,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                )
                              : const LoadingWidget(),
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
                                        color: AppThemes.blueAppColor,
                                        fontSize: 14.sp,
                                      ),
                                    )))
                          ])),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

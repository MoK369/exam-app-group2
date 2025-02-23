import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/loading_widget.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/ui/login/view_model/login_cubit.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/routing/defined_routes.dart';
import '../../../../../core/validation/validation_functions.dart';

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
  GlobalKey<FormState> formKey = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: appLocalizations.login,
          popOutOfTheApp: true,
        ),
        body: BlocProvider(
          create: (context) => cubit,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.isError) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      state.apiErrorModel?.message ?? '',
                    ),
                  ),
                );
              } else if (state.isSuccess) {
                AuthenticationResponseEntity authEntity =
                    state.authEntity ?? AuthenticationResponseEntity();
                print(authEntity.user?.email ?? "No Email");
                print(authEntity.user?.firstName ?? "No Name");
                if (!rememberMe) cubit.doIntent(DeleteLoginInfo());
                // Changing pushReplacementNamed with
                Navigator.pushNamedAndRemoveUntil(
                    context, DefinedRoutes.homeRouteName, (route) => false,
                    arguments: HomeScreenParameters(
                        authEntity: authEntity, rememberMe: rememberMe));
              }
            },
            builder: (context, state) {
              print("Building Login UI");
              return SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: (inputText) {
                            return ValidateFunctions.validationOfEmail(
                                inputText);
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
                          obscureText: true,
                          controller: passwordController,
                          validator: (inputText) {
                            return ValidateFunctions.validationOfPassword(
                                inputText);
                          },
                          onFieldSubmitted: (value) =>
                              passwordFocusNode.requestFocus(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: appLocalizations.password,
                            hintText: appLocalizations.enterPassword,
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
                              child: Text(
                                appLocalizations.forgetPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
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
                            if (!formKey.currentState!.validate()) return;
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

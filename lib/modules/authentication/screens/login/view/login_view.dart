import 'package:exam_app_group2/core/di/di.dart';
import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/loading_widget.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:exam_app_group2/modules/authentication/screens/login/viewModel/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/validation/validation_functions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
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

  var cubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
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
              Navigator.pushReplacementNamed(
                context,
                DefinedRoutes.homeRouteName,
              );
            }
          },
          builder: (context, state) {
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
                          return ValidateFunctions.validationOfEmail(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: "Enter your email",
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: 'password',
                          hintText: "Enter your password",
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
                            'Remember me',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget password ?',
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
                                'Login',
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
    );
  }
}

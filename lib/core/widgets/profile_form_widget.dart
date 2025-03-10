import 'dart:typed_data';

import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/constants/assets/assets_paths.dart';
import 'package:exam_app_group2/core/constants/emojis/emojis.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFormWidget extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final void Function()? onFormChanged,
      onUpdateButtonClick,
      onTextFieldTap,
      onAvatarTap,
      onChangePasswordClick;
  final TextEditingController? userNameController,
      firstNameController,
      lastNameController,
      emailController,
      passwordController,
      phoneNumberController;
  final FocusNode? userNameFocusNode,
      firstNameFocusNode,
      lastNameFocusNode,
      emailFocusNode,
      passwordFocusNode,
      phoneNumberFocusNode;

  final bool areTextFieldsReadOnly;

  final Uint8List? avatarImage;

  const ProfileFormWidget(
      {super.key,
      this.formKey,
      this.onFormChanged,
      this.onUpdateButtonClick,
      this.onTextFieldTap,
      this.onAvatarTap,
      this.onChangePasswordClick,
      this.avatarImage,
      this.userNameController,
      this.firstNameController,
      this.lastNameController,
      this.emailController,
      this.passwordController,
      this.phoneNumberController,
      this.userNameFocusNode,
      this.firstNameFocusNode,
      this.lastNameFocusNode,
      this.emailFocusNode,
      this.passwordFocusNode,
      this.phoneNumberFocusNode,
      this.areTextFieldsReadOnly = true});

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState
    extends BaseStatefulWidgetState<ProfileFormWidget> {
  late ValidateFunctions validateFunctions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
  }

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: widget.formKey,
        onChanged: widget.onFormChanged,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: widget.onAvatarTap,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 48,
                        foregroundImage: widget.avatarImage != null
                            ? MemoryImage(widget.avatarImage!)
                            : null,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                              color: AppColors.blue[40],
                              borderRadius: BorderRadius.circular(6)),
                          child: const ImageIcon(
                            AssetImage(AssetsPaths.cameraIcon),
                            size: 18,
                            color: AppColors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                readOnly: widget.areTextFieldsReadOnly,
                controller: widget.userNameController,
                //signUpFieldsControllers[SignUpFieldsKeys.userName],
                validator: (inputText) {
                  return validateFunctions.validationOfUserName(inputText);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                focusNode: widget.userNameFocusNode,
                //signUpFieldsFocusNodes[SignUpFieldsKeys.userName],
                onFieldSubmitted: (value) =>
                    widget.firstNameFocusNode?.requestFocus(),
                onTap: widget.onTextFieldTap,
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
                        readOnly: widget.areTextFieldsReadOnly,
                        controller: widget.firstNameController,
                        validator: (inputText) {
                          return validateFunctions
                              .validationOfFirstOrLastName(inputText);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        focusNode: widget.firstNameFocusNode,
                        onFieldSubmitted: (value) =>
                            widget.lastNameFocusNode?.requestFocus(),
                        onTap: widget.onTextFieldTap,
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
                        readOnly: widget.areTextFieldsReadOnly,
                        controller: widget.lastNameController,
                        validator: (inputText) {
                          return validateFunctions.validationOfFirstOrLastName(
                              inputText,
                              isFirstName: false);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        focusNode: widget.lastNameFocusNode,
                        onFieldSubmitted: (value) =>
                            widget.emailFocusNode?.requestFocus(),
                        onTap: widget.onTextFieldTap,
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
                readOnly: widget.areTextFieldsReadOnly,
                controller: widget.emailController,
                validator: (inputText) {
                  return validateFunctions.validationOfEmail(inputText);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                focusNode: widget.emailFocusNode,
                onFieldSubmitted: (value) =>
                    widget.phoneNumberFocusNode?.requestFocus(),
                onTap: widget.onTextFieldTap,
                decoration: InputDecoration(
                  labelText: appLocalizations.email,
                  hintText: appLocalizations.enterYourEmail,
                ),
              ),
              RPadding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TextFormField(
                  readOnly: true,
                  // make it always read only cause it only will change when we go the reset password screen
                  controller: widget.passwordController,
                  // validator: (inputText) {
                  //   return validateFunctions.validationOfPassword(inputText);
                  // },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: Emojis.star,
                  focusNode: widget.passwordFocusNode,
                  onFieldSubmitted: (value) =>
                      widget.phoneNumberFocusNode?.requestFocus(),
                  onTap: widget.onTextFieldTap,
                  decoration: InputDecoration(
                    labelText: appLocalizations.password,
                    hintText: appLocalizations.enterPassword,
                    suffixIcon: TextButton(
                        onPressed: widget.onChangePasswordClick,
                        child: Text(appLocalizations.change)),
                  ),
                ),
              ),
              TextFormField(
                readOnly: widget.areTextFieldsReadOnly,
                controller: widget.phoneNumberController,
                validator: (inputText) {
                  return validateFunctions.validationOfPhoneNumber(inputText);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                focusNode: widget.phoneNumberFocusNode,
                onFieldSubmitted: (value) =>
                    widget.phoneNumberFocusNode?.unfocus(),
                onTap: widget.onTextFieldTap,
                decoration: InputDecoration(
                  labelText: appLocalizations.phoneNumber,
                  hintText: appLocalizations.enterPhoneNumber,
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              ElevatedButton(
                onPressed: widget.onUpdateButtonClick,
                child: Text(
                  appLocalizations.update,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ValidateFunctions {
  static ValidateFunctions? _instance;
  late AppLocalizations appLocalizations;

  ValidateFunctions._init(this.appLocalizations);

  static ValidateFunctions getInstance(AppLocalizations appLocalizations) {
    if (_instance == null) {
      _instance = ValidateFunctions._init(appLocalizations);
    } else {
      _instance!.appLocalizations = appLocalizations;
    }
    return _instance!;
  }

  String? validationOfFullName(String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return appLocalizations.pleaseEnterName;
    }
    return null;
  }

  String? validationOfUserName(String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return appLocalizations.pleaseEnterUserName;
    }
    if (inputText.length < 3 || inputText.length > 16) {
      return appLocalizations.userNameLength;
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(inputText)) {
      return appLocalizations.userNameRules;
    }
    return null;
  }

  String? validationOfFirstOrLastName(String? inputText,
      {bool isFirstName = true}) {
    RegExp nameRegExp = RegExp(r'^[A-Za-z]+$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return isFirstName
          ? appLocalizations.pleaseEnterFirstName
          : appLocalizations.pleaseEnterLastName;
    }
    if (!nameRegExp.hasMatch(inputText)) {
      return "Names can only have alphabetic characters.";
    }
    return null;
  }

  String? validationOfEmail(String? inputText) {
    RegExp gmailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return appLocalizations.pleaseEnterEmail;
    }
    if (!gmailRegExp.hasMatch(inputText)) {
      return appLocalizations.pleaseEnterValidEmail;
    }
    return null;
  }

  String? validationOfPhoneNumber(String? inputText) {
    RegExp phoneNumber = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return appLocalizations.pleaseEnterPhoneNumber;
    } else if (!phoneNumber.hasMatch(inputText)) {
      return appLocalizations.phoneNumberRules;
    }
    return null;
  }

  String? validationOfPassword(String? inputText) {
    // RegExp passValid = RegExp(
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return appLocalizations.pleaseEnterPassword;
    } else if (inputText.length < 8) {
      return appLocalizations.passwordLength;
    } else if (!RegExp(r'(?=.*?[A-Z])').hasMatch(inputText)) {
      return appLocalizations.uppercaseRulePassword;
    } else if (!RegExp(r'(?=.*?[a-z])').hasMatch(inputText)) {
      return appLocalizations.lowercaseRulePassword;
    } else if (!RegExp(r'(?=.*?[0-9])').hasMatch(inputText)) {
      return appLocalizations.digitRulePassword;
    } else if (!RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(inputText)) {
      return appLocalizations.specialCharactersRulePassword;
    }
    return null;
  }

  String? validationOfConfirmPassword(
      String? inputText, TextEditingController passwordCont) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return appLocalizations.pleaseConfirmPassword;
    } else if (inputText != passwordCont.text) {
      return appLocalizations.noMatch;
    }
    return null;
  }
}

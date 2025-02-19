import 'package:flutter/material.dart';

class ValidateFunctions {
  static String? validationOfFullName(String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your name.";
    }
    return null;
  }

  static String? validationOfUserName(String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter user name.";
    }
    if (inputText.length < 3 || inputText.length > 16) {
      return 'Username must be between 3 and 16 characters long.';
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(inputText)) {
      return 'Username can only contain letters, numbers, and underscores.';
    }
    return null;
  }

  static String? validationOfFirstOrLastName(String? inputText,
      {bool isFirstName = true}) {
    RegExp nameRegExp = RegExp(r'^[A-Za-z]+$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return isFirstName
          ? "Please enter first name."
          : "Please enter last name.";
    }
    if (!nameRegExp.hasMatch(inputText)) {
      return "Names can only have alphabetic characters.";
    }
    return null;
  }

  static String? validationOfEmail(String? inputText) {
    RegExp gmailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your E-mail.";
    }
    if (!gmailRegExp.hasMatch(inputText)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  static String? validationOfPhoneNumber(String? inputText) {
    RegExp phoneNumber = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your phone number.";
    } else if (!phoneNumber.hasMatch(inputText)) {
      return "Number must start with one of the valid prefixes:\n010, 011, 012, or 015\nfollowed by 8 digits.";
    }
    return null;
  }

  static String? validationOfPassword(String? inputText) {
    RegExp passValid = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your password.";
    } else if (inputText.length < 8) {
      return 'Password must be at least 6 characters long.';
    } else if (!RegExp(r'(?=.*?[A-Z])').hasMatch(inputText)) {
      return 'At least one one uppercase letter.';
    } else if (!RegExp(r'(?=.*?[a-z])').hasMatch(inputText)) {
      return 'At least one one lowercase letter.';
    } else if (!RegExp(r'(?=.*?[0-9])').hasMatch(inputText)) {
      return 'At least one digit must be there.';
    } else if (!RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(inputText)) {
      return 'At least one special character(e.g., #?!@\$%^&*-) must be included.';
    }
    return null;
  }

  static String? validationOfConfirmPassword(
      String? inputText, TextEditingController passwordCont) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your confirm password.";
    } else if (inputText != passwordCont.text) {
      return "No Match";
    }
    return null;
  }
}

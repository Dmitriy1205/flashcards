import 'package:flutter/services.dart';

class Validator {
  static String? validateEmail(String? value) {
    if (value == null) return 'Email cannot be empty';

    if (value.isEmpty) return 'Email cannot be empty';

    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    return !emailValid ? 'Enter a valid email address' : null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty) return "Enter your password";

    String error = "";
    if(value.length < 8){
      error += "● Password length must be at least 8 characters\n";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      error += "● At least one uppercase letter\n";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      error += "● At least one digit\n";
    }

    return error.isEmpty ? null : error;
  }

  static String? validatePasswordEmpty(String? value) {
    if(value == null || value.isEmpty) return "Enter your password";
    return null;
  }
}

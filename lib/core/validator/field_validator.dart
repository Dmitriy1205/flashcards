import 'package:flutter/services.dart';

class Validator {
  static String? validateEmail(String? value) {
    if (value == null) return 'Email cannot be empty';

    if (value.isEmpty) return 'Email cannot be empty';

    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    } else {
      return null;
    }
  }
}

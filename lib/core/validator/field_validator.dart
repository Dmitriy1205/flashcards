import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validator {
  final BuildContext context;
  const Validator(this.context);

  String? validateEmail(String? value) {
    if (value == null) return AppLocalizations.of(context)!.email_cannot_be_empty;

    if (value.isEmpty) return AppLocalizations.of(context)!.email_cannot_be_empty;

    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    return !emailValid ? AppLocalizations.of(context)!.enter_valid_email : null;
  }

  String? validatePassword(String? value){
    if(value == null || value.isEmpty) return AppLocalizations.of(context)!.enter_password;

    String error = "";
    if(value.length < 8){
      error += "● ${AppLocalizations.of(context)!.password_length_greater_than_8}\n";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      error += "● ${AppLocalizations.of(context)!.at_least_one_uppercase}\n";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      error += "● ${AppLocalizations.of(context)!.at_least_one_digit}\n";
    }

    return error.isEmpty ? null : error;
  }

  String? validatePasswordEmpty(String? value) {
    if(value == null || value.isEmpty) return AppLocalizations.of(context)!.enter_password;
    return null;
  }
}

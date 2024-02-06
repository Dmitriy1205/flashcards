import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class AppToast{
  static void showError(BuildContext context, String error){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.red,
        duration: const Duration(seconds: 4),
        content: Text(
          error,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static void showSuccess(BuildContext context, String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.green,
        duration: const Duration(seconds: 7),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
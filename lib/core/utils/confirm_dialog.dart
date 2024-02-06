import 'package:dialog_alert/dialog_alert.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

Future<bool> confirmOperation(BuildContext context, {String? title, String? message, String? action, String? cancel}) async{
  final result = await showDialogAlert(
      context: context,
      title: 'Confirm deleting',
      message: 'Are you sure that you want to delete selected collections?',
      actionButtonTitle: 'Delete',
      actionButtonTextStyle: TextStyle(color: AppColors.green),
      cancelButtonTitle: 'Cancel',
      cancelButtonTextStyle: TextStyle(color: Color(0xFFCD0000))
  );
  return result == ButtonActionType.action;
}
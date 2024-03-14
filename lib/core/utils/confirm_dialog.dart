import 'package:dialog_alert/dialog_alert.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<bool> confirmOperation(BuildContext context, {String? title, String? message, String? action, String? cancel}) async{
  final result = await showDialogAlert(
      context: context,
      title: AppLocalizations.of(context)!.confirmDeleting,
      message: AppLocalizations.of(context)!.deleteSelectedCollection,
      actionButtonTitle: AppLocalizations.of(context)!.delete,
      actionButtonTextStyle: TextStyle(color: AppColors.green),
      cancelButtonTitle: AppLocalizations.of(context)!.cancel,
      cancelButtonTextStyle: TextStyle(color: Color(0xFFCD0000))
  );
  return result == ButtonActionType.action;
}
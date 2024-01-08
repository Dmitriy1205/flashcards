import 'package:flashcards/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/theme.dart';
import '../../blocs/auth/auth_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: GestureDetector(onTap: () {
          context.read<AuthBloc>().add(const AuthEvent.logout());
        },child: Text('LOGOUT',style: TextStyle(color: Colors.black),)),),
      ),
    );
  }
}
showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text(
      'cancel',
      style: TextStyle(color: Colors.blue),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      'logout',
      style: TextStyle(color: Colors.black),
    ),
    onPressed: () {

      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: Text('warning',
        style: AppTheme.themeData.textTheme.titleSmall),
    content: Text('areYouSure',
        style: AppTheme.themeData.textTheme.bodySmall!
            .copyWith(color: Colors.black)),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
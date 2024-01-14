import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/presentation/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/themes/theme.dart';

class WebHomeScreen extends StatelessWidget {
  final Widget child;

  const WebHomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: Stack(
        children: [
          child,
          Positioned(
            left: 87,
            bottom: 51,
            child: Container(
              width: MediaQuery.of(context).size.width/4,
              height: MediaQuery.of(context).size.height/9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppIconButton(
                      onTap: (){
                        router.go('/web_lists');
                      },
                      svgIcon: AppIcons.listsThin),
                  AppIconButton(
                      onTap: (){
                        router.go('/web_learn');
                      },svgIcon: AppIcons.learn),
                  AppIconButton(
                      onTap: (){
                        router.go('/web_profile');
                      },svgIcon: AppIcons.profileThin),
                ],
              ),
            ),
          ),
        ],
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
    title: Text('warning', style: AppTheme.themeData.textTheme.titleSmall),
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

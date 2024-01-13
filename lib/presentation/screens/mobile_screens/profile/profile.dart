import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Column(
      children: [
        Container(
          child: GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              },
              child: Text(
                'logout',
                style: TextStyle(color: Colors.black),
              )),
        ),
        Text('PROFILE SCREEN'),
      ],
    ));
    //   Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: Column(children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Row(children: [
    //             const SizedBox(
    //               width: 19,
    //             ),
    //             Text(
    //               AppStrings.profile,
    //               style: AppTheme.themeData.textTheme.headlineLarge,
    //             ),
    //           ]),
    //           TextButton(
    //             onPressed: () {},
    //             child: Text(
    //               AppStrings.cancel,
    //               style: AppTheme.themeData.textTheme.titleLarge!.copyWith(
    //                 fontSize: 20,
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ]),
    //   ),
    //   body: Container(
    //       color: AppColors.background,
    //       child: Expanded(
    //         child: ListTile(title: Text('Account')),
    //       )),
    // );
  }
}

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/auth/auth_bloc.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 73,
              decoration: BoxDecoration(
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 34.0, right: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // context.read<AuthBloc>().state.user?.photoURL == null ?
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(child: SvgPicture.asset(AppIcons.profileThin),),

                        ),
                        const SizedBox(width: 33,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Account',
                              style: AppTheme.themeData.textTheme.titleLarge!.copyWith(fontSize: 18),
                            ),
                            Text(
                              context.read<AuthBloc>().state.user!.email!,
                              style: AppTheme.themeData.textTheme.titleSmall!.copyWith(color: AppColors.mainAccent),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                        width: 98,
                        child: AppElevatedButton(
                            text: 'Log out',
                            color: Colors.white,
                            borderColor: AppColors.mainAccent,
                            borderRadius: 33,
                            style: AppTheme.themeData.textTheme.labelSmall!
                                .copyWith(color: AppColors.mainAccent),
                            onPressed: () {
                              context.read<AuthBloc>().add(const AuthEvent.logout());
                            })),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27, right: 33),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.language,
                      style: AppTheme.themeData.textTheme.titleSmall!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      AppStrings.english,
                      style: AppTheme.themeData.textTheme.titleSmall!
                          .copyWith(color: AppColors.mainAccent),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );

  }
}

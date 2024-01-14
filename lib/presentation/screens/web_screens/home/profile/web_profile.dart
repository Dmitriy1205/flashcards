import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/const/colors.dart';
import '../../../../../core/const/strings.dart';
import '../../../../../core/themes/theme.dart';
import '../../../../blocs/auth/auth_bloc.dart';

class WebProfileScreen extends StatefulWidget {
  const WebProfileScreen({super.key});

  @override
  State<WebProfileScreen> createState() => _WebProfileScreenState();
}

class _WebProfileScreenState extends State<WebProfileScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 64,
                ),
                Text(
                  AppStrings.profile,
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 49.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(72),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 34.0, right: 44),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                        children: [
                          Container(
                            width: 78,
                            height: 78,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                            ),

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
                                'johndoe@gmail.com',
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
              height: 43,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 87.0),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

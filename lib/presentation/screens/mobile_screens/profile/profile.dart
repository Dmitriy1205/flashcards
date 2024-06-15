import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/auth/auth_bloc.dart';
import 'package:flashcards/presentation/blocs/locale/locale_cubit.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 27, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          // context.read<AuthBloc>().state.user?.photoURL == null ?
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: SvgPicture.asset(AppIcons.profileThin),
                            ),
                          ),
                          const SizedBox(
                            width: 23,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.account,
                                  style: AppTheme
                                      .themeData.textTheme.titleLarge!
                                      .copyWith(fontSize: 18),
                                ),
                                Text(
                                  context.read<AuthBloc>().state.user!.email!,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme
                                      .themeData.textTheme.titleSmall!
                                      .copyWith(
                                          color: AppColors.mainAccent,
                                          fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    SizedBox(
                        width: 84,
                        child: AppElevatedButton(
                            text: AppLocalizations.of(context)!.logout,
                            shadowColor: Colors.transparent,
                            color: Colors.white,
                            borderColor: AppColors.mainAccent,
                            borderRadius: 33,
                            style: AppTheme.themeData.textTheme.labelSmall!
                                .copyWith(color: AppColors.mainAccent),
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.logout());
                            })),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27, right: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: AppTheme.themeData.textTheme.titleSmall!
                          .copyWith(color: Colors.black),
                    ),
                    Theme(
                      data: ThemeData(
                        canvasColor: Colors.transparent
                      ),
                      child: DropdownMenu(
                        textStyle: AppTheme
                            .themeData.textTheme.titleSmall!
                            .copyWith(color: AppColors.mainAccent),
                        menuStyle: const MenuStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                          shadowColor: MaterialStatePropertyAll(Colors.transparent,),
                          surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        initialSelection: context.watch<LocaleCubit>().state.languageName,
                          inputDecorationTheme: const InputDecorationTheme(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelStyle: TextStyle(color: AppColors.mainAccent),
                            suffixIconColor: AppColors.mainAccent,
                            iconColor: AppColors.mainAccent,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none
                          ),
                          onSelected: (val){
                            context.read<LocaleCubit>().changeLang(LocaleEnum.fromLanguageName(val!));
                          },
                          dropdownMenuEntries: List.generate(LocaleEnum.values.length, (index){
                            return DropdownMenuEntry(
                                value: LocaleEnum.values[index].languageName,
                                label: LocaleEnum.values[index].languageName,
                                style: ButtonStyle(
                                    textStyle: MaterialStatePropertyAll(AppTheme
                                        .themeData.textTheme.titleSmall!
                                        .copyWith(color: AppColors.mainAccent))));
                          })),
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

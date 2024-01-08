import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const/colors.dart';
import '../../core/const/icons.dart';
import '../../core/const/strings.dart';
import '../../core/services/service_locator.dart';
import '../../core/themes/theme.dart';
import '../blocs/google_sign_in/google_signin_bloc.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({Key? key}) : super(key: key);
  final GoogleSigninBloc _bloc = sl<GoogleSigninBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSigninBloc, GoogleSigninState>(
      bloc: _bloc,
      listener: (context, state) {
        state.maybeMap(
            error: (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.red,
                  duration: const Duration(seconds: 5),
                  content: Text(
                    e.error,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            orElse: () {});
      },
      builder: (context, state) {
        return Expanded(
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              onTap:  () {
                      state.maybeMap(
                          loading: (_) => null,
                          initial: (_) => _bloc
                              .add(const GoogleSigninEvent.signInWithGoogle()),
                          orElse: () => _bloc
                              .add(const GoogleSigninEvent.signInWithGoogle()));
                    },
              child: Ink(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyLight),
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: 41,
                  child: state.maybeMap(
                    initial: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          AppIcons.google,
                        ),
                        Text(
                          AppStrings.google,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(),
                      ],
                    ),
                    loading: (_) => const Center(
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.mainAccent,
                          )),
                    ),
                    orElse: () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(AppIcons.google),
                        Text(
                          AppStrings.google,
                          style: AppTheme.themeData.textTheme.labelMedium,
                        ),
                        const SizedBox(),
                      ],
                      // ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

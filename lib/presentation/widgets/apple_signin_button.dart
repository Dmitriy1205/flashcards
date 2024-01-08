import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/const/colors.dart';
import '../../core/const/strings.dart';
import '../../core/themes/theme.dart';

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({Key? key}) : super(key: key);
  // final AppleSigninBloc _bloc = sl<AppleSigninBloc>();

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AppleSigninBloc, AppleSigninState>(
    //   bloc: _bloc,
    //   builder: (context, state) {
        return Expanded(
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: InkWell(customBorder:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),

              // onTap:!isAgree ? null : () {
              //   state.maybeMap(
              //       loading: (_) => null,
              //       initial: (_) =>
              //           _bloc.add(const AppleSigninEvent.signInWithApple()),
              //       orElse: () =>
              //           _bloc.add(const AppleSigninEvent.signInWithApple()));
              // },
              child: Ink(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyLight),
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: 41,
                  child:
                  // state.maybeMap(
                  //   loading: (_) => const Center(
                  //     child: SizedBox(
                  //         height: 20,
                  //         width: 20,
                  //         child: CircularProgressIndicator(
                  //           color: Colors.white,
                  //         )),
                  //   ),
                  //   orElse: () =>
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.apple,
                          size: 30,
                          color: Colors.black,
                        ),
                        Text(
                          AppStrings.apple,
                          style: AppTheme.themeData.textTheme.labelMedium,
                        ),
                        const SizedBox(width: 10,),
                      ],
                    // ),
                  ),
                ),
              ),
            ),
          ),
        );
    //   },
    // );
  }
}

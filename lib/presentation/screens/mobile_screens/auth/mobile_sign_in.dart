import 'dart:io';

import 'package:flashcards/core/const/images.dart';
import 'package:flashcards/core/validator/field_validator.dart';
import 'package:flashcards/presentation/screens/mobile_screens/auth/mobile_forgot_password.dart';
import 'package:flashcards/presentation/widgets/app_text_field.dart';
import 'package:flashcards/presentation/widgets/apple_signin_button.dart';
import 'package:flashcards/presentation/widgets/google_signin_button.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icons.dart';
import '../../../../core/const/strings.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/themes/theme.dart';
import '../../../blocs/sign_in/signin_bloc.dart';
import '../../../widgets/app_elevated_button.dart';
import 'mobile_sign_up.dart';

class MobileSignInScreen extends StatefulWidget {
  const MobileSignInScreen({super.key});

  @override
  State<MobileSignInScreen> createState() => _MobileSignInScreenState();
}

class _MobileSignInScreenState extends State<MobileSignInScreen> {
  final SigninBloc _signInBloc = sl<SigninBloc>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  bool isPassObscure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: BlocConsumer<SigninBloc, SigninState>(
            bloc: _signInBloc,
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
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 52.0),
                            child: Image.asset(AppImages.logo,scale: 1.5,),
                          ),
                          Text(
                            AppStrings.login,
                            style: AppTheme.themeData.textTheme.headlineLarge,
                          ),
                          Text(
                            AppStrings.loginHead,
                            style: AppTheme.themeData.textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            AppStrings.email,
                            style: AppTheme.themeData.textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          AppTextField(
                            focusNode: _emailNode,
                            textController: _emailController,
                            hintText: AppStrings.enterEmail,
                            validator: Validator.validateEmail,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            AppStrings.password,
                            style: AppTheme.themeData.textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          AppTextField(
                            focusNode: _passwordNode,
                            obscureText: isPassObscure,
                            textController: _passwordController,
                            hintText: AppStrings.enterPass,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassObscure = !isPassObscure;
                                });
                              },
                              icon: isPassObscure
                                  ? SvgPicture.asset(AppIcons.closedEye)
                                  : SvgPicture.asset(AppIcons.openEye),
                            ),
                            validator: Validator.validate,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const MobileForgotPasswordScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  '${AppStrings.forgotPass}?',
                                  style: AppTheme.themeData.textTheme.titleSmall,
                                )),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          AppElevatedButton(
                            widget: state.maybeMap(
                              loading: (_)=> const SizedBox(width:20,height:20,child: LoadingIndicator(color: Colors.white,)),
                                orElse: ()=>Text(
                              AppStrings.buttonLogin,
                              style: AppTheme.themeData.textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                            )),
                              text: AppStrings.buttonLogin, onPressed: () {
                            if (!_formKey.currentState!
                                .validate()) {
                              return;
                            }
                            _formKey.currentState!.save();

                            _signInBloc.add(
                              SigninEvent
                                  .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 17,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: AppTheme.themeData.textTheme
                                          .titleSmall,
                                      children: [
                                        const TextSpan(
                                          text: '${AppStrings.dontHaveAccount} ',
                                        ),
                                        TextSpan(
                                            text: AppStrings.signUp,
                                            style: const TextStyle(
                                              color: AppColors.mainAccent,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                     MobileSignUpScreen(),
                                                  ),
                                                );
                                              }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 51,
                          ),
                          Row(
                            children: [
                              const Flexible(
                                child: Divider(
                                  color: AppColors.grey,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Text(
                                  AppStrings.orWith,
                                  style: AppTheme.themeData.textTheme.titleSmall,
                                ),
                              ),
                              const Flexible(
                                child: Divider(
                                  color: AppColors.grey,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 39,
                          ),
                          Platform.isIOS ? Row(
                            children: [
                               AppleSignInButton(),
                              const SizedBox(
                                width: 24,
                              ),
                              GoogleSignInButton(),
                            ],
                          ) : SizedBox(child: GoogleSignInButton()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _signInBloc.close();
    super.dispose();
  }
}

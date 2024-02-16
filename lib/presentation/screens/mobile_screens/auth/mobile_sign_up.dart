import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/icons.dart';
import '../../../../core/router/router.dart';
import '../../../../core/validator/field_validator.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/sign_up/signup_bloc.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/loading_indicator.dart';

class MobileSignUpScreen extends StatefulWidget {
  const MobileSignUpScreen({super.key});

  @override
  State<MobileSignUpScreen> createState() => _MobileSignUpScreenState();
}

class _MobileSignUpScreenState extends State<MobileSignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  bool isPassObscure = true;

  bool _emailWasFocused = false;
  bool _emailWasUnfocused = false;
  bool get _validateEmail => _emailWasFocused && _emailWasUnfocused;

  @override
  void initState() {
    _emailNode.addListener(_emailFocusChanged);
    super.initState();
  }

  void _emailFocusChanged(){
    if(_emailNode.hasFocus){
      _emailWasFocused = true;
    }else{
      _emailWasUnfocused = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        child: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            state.maybeMap(
              success: (_) {
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                    AppToast.showSuccess(context,
                        'Verify your email, please check your inbox including spam and follow the instructions');
                    router.pop();
                  },
                error: (e) {
                  AppToast.showError(context, e.error);
                },
                orElse: () {});
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 110.0, left: 24, right: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.createAccount,
                          style: AppTheme.themeData.textTheme.headlineLarge,
                        ),
                        Text(
                          AppStrings.createAccountHeader,
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
                          validator: !_validateEmail ? (_) => null : Validator.validateEmail,
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
                          validator: Validator.validatePassword,
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        AppElevatedButton(
                            widget: state.maybeMap(
                                loading: (_)=> const SizedBox(width:20,height:20,child: LoadingIndicator(color: Colors.white,)),
                                orElse: ()=>Text(
                                  AppStrings.createAccount,
                                  style: AppTheme.themeData.textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                                )),
                            text: AppStrings.createAccount,
                            onPressed: () async{
                              if(!_validateEmail){
                                setState(() {
                                  _emailWasFocused = true;
                                  _emailWasUnfocused = true;
                                });
                                await Future.delayed(Duration(seconds: 1));
                              }
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();
                              context.read<SignupBloc>().add(
                                  SignupEvent.signUpWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text));
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
                                    style:
                                        AppTheme.themeData.textTheme.titleSmall,
                                    children: [
                                      const TextSpan(
                                        text: '${AppStrings.haveAccount} ',
                                      ),
                                      TextSpan(
                                          text: AppStrings.signIn,
                                          style: const TextStyle(
                                            color: AppColors.mainAccent,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pop(context);
                                            }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailNode.removeListener(_emailFocusChanged);
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }
}

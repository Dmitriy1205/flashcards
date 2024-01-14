import 'package:flashcards/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/images.dart';
import '../../../../core/const/strings.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/validator/field_validator.dart';
import '../../../blocs/forgot_password/forgot_password_bloc.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/loading_indicator.dart';

class WebForgotPasswordScreen extends StatefulWidget {
  const WebForgotPasswordScreen({super.key});

  @override
  State<WebForgotPasswordScreen> createState() =>
      _WebForgotPasswordScreenState();
}

class _WebForgotPasswordScreenState extends State<WebForgotPasswordScreen> {
  final ForgotPasswordBloc _bloc = sl<ForgotPasswordBloc>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();
  bool isHoveredButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          bloc: _bloc,
          listener: (context, state) {
            state.maybeMap(
                error: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 5),
                      content: Text(
                        e.error,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                success: (_) {
                  router.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.green,
                      duration: Duration(seconds: 5),
                      content: Text(
                        'Check your Email',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                orElse: () {});
          },
          builder: (context, state) {
            return SelectionArea(
              child: Scaffold(
                body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  if(constraints.maxWidth < 700){
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 110.0, left: 24, right: 24,bottom: 150),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  router.pop();
                                },
                                child: const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronLeft,
                                      size: 18,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 76,
                            ),
                            Text(
                              AppStrings.forgotPass,
                              style: AppTheme.themeData.textTheme.headlineLarge,
                            ),
                            Text(
                              AppStrings.forgotPassHeader,
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
                            Form(
                              key: _formKey,
                              child: AppTextField(
                                focusNode: _emailNode,
                                textController: _emailController,
                                hintText: AppStrings.enterEmail,
                                validator: Validator.validateEmail,
                              ),
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isHoveredButton = !isHoveredButton;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isHoveredButton = !isHoveredButton;
                                });
                              },
                              child: AppElevatedButton(
                                  color: isHoveredButton
                                      ? AppColors.mainAccent
                                      : AppColors.mainAccent.withOpacity(0.6),
                                  widget: state.maybeMap(
                                      loading: (_) => const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: LoadingIndicator(
                                            color: Colors.white,
                                          )),
                                      orElse: () => Text(
                                        AppStrings.buttonSend,
                                        style: AppTheme
                                            .themeData.textTheme.titleSmall!
                                            .copyWith(color: Colors.white),
                                      )),
                                  text: AppStrings.buttonSend,
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    _formKey.currentState!.save();
                                    _bloc.add(ForgotPasswordEvent.resetPassword(
                                        email: _emailController.text));
                                  }),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.forgot),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 127.0, left: 80, right: 80, bottom: 260),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      router.pop();
                                    },
                                    child: const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: FaIcon(
                                          FontAwesomeIcons.chevronLeft,
                                          size: 18,
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 76,
                                ),
                                Text(
                                  AppStrings.forgotPass,
                                  style: AppTheme.themeData.textTheme.headlineLarge,
                                ),
                                Text(
                                  AppStrings.forgotPassHeader,
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
                                Form(
                                  key: _formKey,
                                  child: AppTextField(
                                    focusNode: _emailNode,
                                    textController: _emailController,
                                    hintText: AppStrings.enterEmail,
                                    validator: Validator.validateEmail,
                                  ),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                MouseRegion(
                                  onEnter: (_) {
                                    setState(() {
                                      isHoveredButton = !isHoveredButton;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      isHoveredButton = !isHoveredButton;
                                    });
                                  },
                                  child: AppElevatedButton(
                                      color: isHoveredButton
                                          ? AppColors.mainAccent
                                          : AppColors.mainAccent.withOpacity(0.6),
                                      widget: state.maybeMap(
                                          loading: (_) => const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: LoadingIndicator(
                                                color: Colors.white,
                                              )),
                                          orElse: () => Text(
                                            AppStrings.buttonSend,
                                            style: AppTheme
                                                .themeData.textTheme.titleSmall!
                                                .copyWith(color: Colors.white),
                                          )),
                                      text: AppStrings.buttonSend,
                                      onPressed: () {
                                        if (!_formKey.currentState!.validate()) {
                                          return;
                                        }
                                        _formKey.currentState!.save();
                                        _bloc.add(ForgotPasswordEvent.resetPassword(
                                            email: _emailController.text));
                                      }),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },

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
    _emailController.dispose();
    _emailNode.dispose();
    super.dispose();
  }
}

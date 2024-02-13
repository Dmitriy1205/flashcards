import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/strings.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/themes/theme.dart';
import '../../../../core/validator/field_validator.dart';
import '../../../blocs/forgot_password/forgot_password_bloc.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/loading_indicator.dart';

class MobileForgotPasswordScreen extends StatefulWidget {
  const MobileForgotPasswordScreen({super.key});

  @override
  State<MobileForgotPasswordScreen> createState() =>
      _MobileForgotPasswordScreenState();
}

class _MobileForgotPasswordScreenState
    extends State<MobileForgotPasswordScreen> {
  final ForgotPasswordBloc _bloc = sl<ForgotPasswordBloc>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            bloc: _bloc,
            listener: (context, state) {
              state.maybeMap(
                  error: (e) {
                    AppToast.showError(context, e.error);
                  },
                  success: (_) {
                    Navigator.pop(context);
                    AppToast.showSuccess(context, "Email sent, please check your inbox including spam");
                  },
                  orElse: () {});
            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 55.0, left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        AppElevatedButton(
                            widget: state.maybeMap(
                                loading: (_)=> const SizedBox(width:20,height:20,child: LoadingIndicator(color: Colors.white,)),
                                orElse: ()=>Text(
                                  AppStrings.buttonSend,
                                  style: AppTheme.themeData.textTheme.titleSmall!
                                      .copyWith(color: Colors.white),
                                )),
                            text: AppStrings.buttonSend, onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          _bloc.add(ForgotPasswordEvent.resetPassword(
                              email: _emailController.text));
                        }),
                        const SizedBox(
                          height: 17,
                        ),
                      ],
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
    _emailNode.dispose();
    super.dispose();
  }
}

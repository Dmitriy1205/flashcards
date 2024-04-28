import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/const/colors.dart';
import '../../core/themes/theme.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.focusNode,
    required this.textController,
    required this.validator,
    this.isSavePressed,
    this.inputFormatter,
    this.width,
    this.height,
    this.maxLines,
    this.autofillHints,
    this.keyboardType,
    // this.onChange,
    this.hintText, this.suffixIcon, this.obscureText,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController textController;
  final double? width;
  final double? height;
  final int? maxLines;
  final String? Function(String?) validator;
  TextInputFormatter? inputFormatter;
  bool? isSavePressed;
  // final Function(dynamic val)? onChange;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        obscuringCharacter: '*',
        autovalidateMode:AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText: obscureText ?? false,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        focusNode: focusNode,
        controller: textController,
        // onChanged: (v) {
        //   onChange!(v);
        // },
        maxLines: maxLines ?? 1,
        style:
        AppTheme.themeData.textTheme.labelSmall!.copyWith(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: AppTheme.themeData.textTheme.labelSmall,
          hintText: hintText ?? '' ,
          isDense: true,
          suffixIcon: suffixIcon ?? const SizedBox(),
          constraints: const BoxConstraints(minHeight: 45),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        ),
      ),
    );
  }


}

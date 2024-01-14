import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/themes/theme.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final bool showArrow;
  final bool showPrefix;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final double? borderRadius;
  final Widget? widget;
  final Color? color;
  final Color? borderColor;

  const AppElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.style,
    this.showArrow = false,
    this.showPrefix = false,
    this.borderRadius,
    this.widget,
    this.color, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.white,
          backgroundColor: color ?? AppColors.mainAccent,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(14)
                  : BorderRadius.circular(borderRadius!)),
        ),
        child: widget ??
            Text(
              text,
              style: style ??
                  AppTheme.themeData.textTheme.titleSmall!
                      .copyWith(color: Colors.white),
            ),
      ),
    );
  }
}

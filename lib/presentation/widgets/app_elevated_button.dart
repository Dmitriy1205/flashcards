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

  const AppElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.style,
    this.showArrow = false,
    this.showPrefix = false,
    this.borderRadius, this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainAccent,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(14)
                  : BorderRadius.circular(borderRadius!)),
        ),
        child:widget ?? Text(
          text,
          style: style ??
              AppTheme.themeData.textTheme.titleSmall!
                  .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

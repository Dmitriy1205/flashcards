import 'package:flashcards/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconButton extends StatelessWidget {
  final String svgIcon;
  final VoidCallback? onTap;
  final Color? color;
  final double? height;
  final double? width;

  const AppIconButton({
    super.key,
    required this.svgIcon,
    this.onTap,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width ?? 30,
              height: height ?? 30,
              child: SvgPicture.asset(
                svgIcon,
                color: color ?? AppColors.neutralGrey,
              ),
            ),
          )),
    );
  }
}

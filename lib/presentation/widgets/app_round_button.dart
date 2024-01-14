import 'package:flashcards/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppRoundButton extends StatelessWidget {
  final String svgIcon;
  final Color? color;
  final bool showBorder;
  final VoidCallback? onTap;

  const AppRoundButton({super.key, required this.svgIcon, this.onTap, this.color, required this.showBorder});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(60),
          child: Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: color ?? AppColors.mainAccent,
                borderRadius: BorderRadius.circular(60),
                border: showBorder ? Border.all(color: AppColors.mainAccent,width: 2): const Border(),
              ),
              child: SvgPicture.asset(svgIcon,width: 29,height:29 ,fit: BoxFit.scaleDown,))),
    );
  }
}

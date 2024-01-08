
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  const LoadingIndicator({
    Key? key, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.mainAccent,
      ),
    );
  }
}

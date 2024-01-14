import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';

class WebLearnScreen extends StatelessWidget {
  const WebLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.greyLight,
      body: Center(
        child: Text('Learn'),
      ),
    );
  }
}

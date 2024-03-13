import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/const/strings.dart';
import '../../../../../core/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebLearnScreen extends StatelessWidget {
  const WebLearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 64,
                ),
                Text(
                  AppLocalizations.of(context)!.learn,
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.greyLight,
      body: Center(
        child: Text('Learn'),
      ),
    );
  }
}

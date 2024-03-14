import 'package:flashcards/core/providers/providers.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../presentation/screens/mobile_screens/auth/mobile_sign_in.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: BlocBuilder<LocaleCubit,LocaleEnum>(
        builder: (context,state) => MaterialApp.router(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: LocaleEnum.values.map((e) => Locale(e.localeCode)).toList(),
          locale: Locale(state.localeCode),
          scrollBehavior: const AppScrollBehavior(),
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
          // home: kIsWeb ? const WebSignUpScreen() : MobileSignInScreen(),
        ),
      ),
    );
  }
}

class AppScrollBehavior extends ScrollBehavior {
  const AppScrollBehavior();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const BouncingScrollPhysics();
}


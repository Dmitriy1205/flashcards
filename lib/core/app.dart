import 'package:flashcards/core/providers/providers.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/screens/mobile_screens/auth/mobile_sign_up.dart';
import 'package:flashcards/presentation/screens/web_screens/auth/web_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/mobile_screens/auth/mobile_sign_in.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp.router(
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        // home: kIsWeb ? const WebSignUpScreen() : MobileSignInScreen(),
      ),
    );
  }
}

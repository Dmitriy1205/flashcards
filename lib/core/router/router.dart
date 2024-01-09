import 'dart:async';
import 'package:flashcards/presentation/screens/web_screens/auth/web_forgot_password.dart';
import 'package:flashcards/presentation/screens/web_screens/web_main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/screens/mobile_screens/auth/mobile_sign_in.dart';
import '../../presentation/screens/mobile_screens/main_screen.dart';
import '../../presentation/screens/web_screens/auth/web_sign_in.dart';
import '../../presentation/screens/web_screens/auth/web_sign_up.dart';
import '../../presentation/screens/web_screens/home.dart';
import '../services/service_locator.dart';

final AuthBloc _bloc = sl<AuthBloc>();

final GoRouter router = GoRouter(
  routes: [
    kIsWeb
        ? ShellRoute(
            builder: (context, state, child) => Scaffold(
              body: WebMainScreen(
                child: child,
              ),
            ),
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => pageTransition<void>(
                  context: context,
                  state: state,
                  child: const WebSignInScreen(),
                ),
                redirect: (contest, state) {
                  final st = _bloc.state;

                  return st.maybeMap(
                      authenticated: (_) => '/web_main',
                      unauthenticated: (_) => '/',
                      orElse: () => null);
                },
              ),
              GoRoute(
                path: '/sign_up',
                pageBuilder: (context, state) => pageTransition<void>(
                  context: context,
                  state: state,
                  child: const WebSignUpScreen(),
                ),
              ),
              GoRoute(
                path: '/forgot_pass',
                pageBuilder: (context, state) => pageTransition<void>(
                  context: context,
                  state: state,
                  child: const WebForgotPasswordScreen(),
                ),
              ),
            ],
          )
        : GoRoute(
            path: '/',
            pageBuilder: (c, s) =>
                const MaterialPage(child: MobileSignInScreen()),
            redirect: (contest, state) {
              final st = _bloc.state;

              return st.maybeMap(
                  authenticated: (_) => '/mobile_main',
                  unauthenticated: (_) => '/',
                  orElse: () => null);
            },
          ),
    GoRoute(
        path: '/mobile_main',
        pageBuilder: (context, state) => pageTransition<void>(
              context: context,
              state: state,
              child: const MainScreen(),
            ),
        redirect: (contest, state) {
          final st = _bloc.state;

          return st.maybeMap(
              authenticated: (_) => '/mobile_main',
              unauthenticated: (_) => '/',
              orElse: () => null);
        }),
    GoRoute(
      path: '/web_main',
      pageBuilder: (context, state) => pageTransition<void>(
        context: context,
        state: state,
        child: const Home(),
      ),
      redirect: (contest, state) {
        final st = _bloc.state;

        return st.maybeMap(
            authenticated: (_) => '/web_main',
            unauthenticated: (_) => '/',
            orElse: () => null);
      },
    ),
  ],
  refreshListenable: GoRouterRefreshStream(_bloc.stream),
);

CustomTransitionPage pageTransition<T>({
  Key? key,
  String? restorationId,
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    restorationId: restorationId,
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInExpo;
      // final tween = Tween(begin: Offset.zero, end: Offset.zero);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return FadeTransition(
        // position: tween.animate(curvedAnimation),
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (event) => notifyListeners(),
        );
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

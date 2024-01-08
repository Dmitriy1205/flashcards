import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/screens/mobile_screens/auth/mobile_sign_in.dart';
import '../../presentation/screens/mobile_screens/main_screen.dart';
import '../../presentation/screens/web_screens/auth/web_sign_up.dart';
import '../services/service_locator.dart';

final AuthBloc _bloc = sl<AuthBloc>();

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (c, s) => const MaterialPage(
        child: kIsWeb ? WebSignUpScreen() : MobileSignInScreen()),
    redirect: (contest, state) {
      final st = _bloc.state;

      return st.maybeMap(
          authenticated: (_) => kIsWeb ? 'web_main' : '/mobile_main',
          unauthenticated: (_) => '/',
          orElse: () => null);
    },
    // routes: [
    //
    // ],
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
            authenticated: (_) => kIsWeb ? 'web_main' : '/mobile_main',
            unauthenticated: (_) => '/',
            orElse: () => null);
      }
  )
], refreshListenable: GoRouterRefreshStream(_bloc.stream));

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
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return SlideTransition(
        position: tween.animate(curvedAnimation),
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

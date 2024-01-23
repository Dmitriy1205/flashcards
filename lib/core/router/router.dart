import 'dart:async';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/screens/mobile_screens/home.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/cards.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/create_edit_card.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/view_flash_card.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/learn.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/lists_screen.dart';
import 'package:flashcards/presentation/screens/mobile_screens/profile/profile.dart';
import 'package:flashcards/presentation/screens/web_screens/auth/web_forgot_password.dart';
import 'package:flashcards/presentation/screens/web_screens/home/learn/web_learn.dart';
import 'package:flashcards/presentation/screens/web_screens/home/lists/cards/web_cards.dart';
import 'package:flashcards/presentation/screens/web_screens/home/lists/cards/web_create_card.dart';
import 'package:flashcards/presentation/screens/web_screens/home/lists/web_lists.dart';
import 'package:flashcards/presentation/screens/web_screens/web_main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/screens/mobile_screens/auth/mobile_sign_in.dart';
import '../../presentation/screens/web_screens/auth/web_sign_in.dart';
import '../../presentation/screens/web_screens/auth/web_sign_up.dart';
import '../../presentation/screens/web_screens/home/home.dart';
import '../../presentation/screens/web_screens/home/lists/cards/web_edit_card.dart';
import '../../presentation/screens/web_screens/home/profile/web_profile.dart';
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
                pageBuilder: (context, state) => fadeAnimation<void>(
                  context: context,
                  state: state,
                  child: const WebSignInScreen(),
                ),
                redirect: (contest, state) {
                  final st = _bloc.state;

                  return st.maybeMap(
                      authenticated: (_) => '/web_lists',
                      unauthenticated: (_) => '/',
                      orElse: () => null);
                },
              ),
              GoRoute(
                path: '/sign_up',
                pageBuilder: (context, state) => fadeAnimation<void>(
                  context: context,
                  state: state,
                  child: const WebSignUpScreen(),
                ),
              ),
              GoRoute(
                path: '/forgot_pass',
                pageBuilder: (context, state) => fadeAnimation<void>(
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
                  authenticated: (_) => '/mobile_home',
                  unauthenticated: (_) => '/',
                  orElse: () => null);
            },
          ),
    GoRoute(
        path: '/mobile_home',
        pageBuilder: (context, state) => fadeAnimation<void>(
              context: context,
              state: state,
              child: const HomeMobile(),
            ),
        redirect: (contest, state) {
          final st = _bloc.state;
          return st.maybeMap(
              authenticated: (_) => '/mobile_home',
              unauthenticated: (_) => '/',
              orElse: () => null);
        }),
    ShellRoute(
      builder: (c, s, child) {
        return Scaffold(body: WebHomeScreen(child: child));
      },
      routes: [
        GoRoute(
          path: '/web_lists',
          pageBuilder: (context, state) => fadeAnimation<void>(
            context: context,
            state: state,
            child: const WebListsScreen(),
          ),
        ),
        GoRoute(
          path: '/web_learn',
          pageBuilder: (context, state) => fadeAnimation<void>(
            context: context,
            state: state,
            child: const WebLearnScreen(),
          ),
        ),
        GoRoute(
          path: '/web_profile',
          pageBuilder: (context, state) => fadeAnimation<void>(
            context: context,
            state: state,
            child: const WebProfileScreen(),
          ),
          redirect: (contest, state) {
            final st = _bloc.state;

            return st.maybeMap(
                authenticated: (_) => '/web_profile',
                unauthenticated: (_) => '/',
                orElse: () => null);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/web_cards',
      pageBuilder: (context, state) => slideAnimation<void>(
        context: context,
        state: state,
        child: WebCards(
          collectionName:
              (state.extra as Map<String, dynamic>?)?["collectionName"],
          collectionId: (state.extra as Map<String, dynamic>?)?['collectionId'],
        ),
      ),
    ),
    GoRoute(
      path: '/create_card',
      pageBuilder: (context, state) => slideBottomAnimation<void>(
        context: context,
        state: state,
        child: WebCreateCard(
          collectionId: (state.extra as Map<String, dynamic>?)?['collectionId'],
        ),
      ),
    ),
    GoRoute(
      path: '/edit_card',
      pageBuilder: (context, state) {
        return slideBottomAnimation<void>(
          context: context,
          state: state,
          child: WebEditCard(
            card: state.extra as CardEntity,
          ),
        );
      },
    ),
    GoRoute(path: '/learn', builder: (context, state) => const Learn()),
    GoRoute(path: '/lists', builder: (context, state) => const Lists()),
    GoRoute(path: '/profile', builder: (context, state) => const Profile()),
    GoRoute(
      path: '/cards',
      pageBuilder: (context, state) => slideAnimation<void>(
        context: context,
        state: state,
        child: Cards(
            collectionName:
                (state.extra as Map<String, dynamic>?)?["collectionName"],
            collectionId:
                (state.extra as Map<String, dynamic>?)?['collectionId']),
      ),
    ),
    GoRoute(
      path: '/collection_share',
      pageBuilder: (context, state) => slideAnimation<void>(
        context: context,
        state: state,
        child: Cards(
            collectionId: state.uri.queryParameters['collectionId']!,
            collectionName: state.uri.queryParameters['collectionName']!,
            sender: state.uri.queryParameters['sender']!),
      ),
    ),
    GoRoute(
        path: '/view_card_mobile',
        builder: (context, state) {
          return ViewFlashCard(
              collectionId:
                  (state.extra as Map<String, dynamic>?)?['collectionId']!,
              card: (state.extra as Map<String, dynamic>?)?['card']);
        }),
    GoRoute(
      path: '/create_edit_card_mobile',
      pageBuilder: (context, state) => slideBottomAnimation<void>(
        context: context,
        state: state,
        child: CreateEditCard(
            collectionId:
                (state.extra as Map<String, dynamic>?)?['collectionId'],
            cardEntity: (state.extra as Map<String, dynamic>?)?['card']),
      ),
    ),
  ],
  refreshListenable: GoRouterRefreshStream(_bloc.stream),
);

CustomTransitionPage fadeAnimation<T>({
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

CustomTransitionPage slideAnimation<T>({
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
      const curve = Curves.easeInOut;
      final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
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

CustomTransitionPage slideBottomAnimation<T>({
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
      const curve = Curves.easeInOut;
      final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
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

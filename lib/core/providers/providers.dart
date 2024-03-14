import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/blocs/locale/locale_cubit.dart';
import 'package:flashcards/presentation/blocs/sign_in/signin_bloc.dart';
import 'package:flashcards/presentation/blocs/sign_up/signup_bloc.dart';
import 'package:flashcards/presentation/blocs/web_list/web_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/blocs/auth/auth_bloc.dart';
import '../services/service_locator.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<SigninBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<SignupBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<ListsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CardsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<WebListBloc>(),
        ),
        BlocProvider(create: (context) => sl<LocaleCubit>())
      ],
      child: child,
    );
  }
}

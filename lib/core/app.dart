import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/screens/lists_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: Material(child: Lists()),
    );
  }
}

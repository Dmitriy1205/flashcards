import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  final Widget child;

  const DesktopLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
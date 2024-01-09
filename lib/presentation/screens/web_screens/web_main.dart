import 'package:flutter/material.dart';

import 'layouts/desktop.dart';
import 'layouts/mobile.dart';
import 'layouts/responsive_layout.dart';

class WebMainScreen extends StatelessWidget {
  final Widget child;

  const WebMainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileLayout: MobileLayout(child: child),
        desktopLayout: SelectionArea(child: DesktopLayout(child: child)),
      ),
    );
  }
}

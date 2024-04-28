import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformWidgets {
  static Widget contextMenu(
      {required Widget child, required List<ContextMenuItem> actions}) {
    if (Platform.isAndroid) {
      return _AndroidContextMenu(
        actions: actions,
        child: child,
      );
    }
    return _IOSContextMenu(actions: actions, child: child);
  }
}

class ContextMenuItem {
  final Widget child;
  final VoidCallback onTap;

  const ContextMenuItem({
    required this.child,
    required this.onTap,
  });
}

class _IOSContextMenu extends StatelessWidget {
  final Widget child;
  final List<ContextMenuItem> actions;

  const _IOSContextMenu({required this.child, required this.actions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                actions: actions
                    .map((e) => CupertinoActionSheetAction(
                          onPressed: (){
                            e.onTap();
                            Navigator.of(context).pop();
                          },
                          child: Material(
                              color: Colors.transparent, child: e.child),
                        ))
                    .toList(),
              );
            });
      },
      child: child,
    );
  }
}

class _AndroidContextMenu extends StatelessWidget {
  final Widget child;
  final List<ContextMenuItem> actions;

  const _AndroidContextMenu({required this.child, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: DropdownButton<String>(
          isDense: true,
          underline: const Text(''),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(7)),
          items: actions
              .asMap().entries.map((e) => DropdownMenuItem(onTap: e.value.onTap , child: e.value.child, value: 'false',))
              .toList(),
          onChanged: (_) {},
          icon: child),
    );
  }
}

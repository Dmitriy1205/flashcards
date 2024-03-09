import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget content;
  const CustomAppBar({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withOpacity(0.5),
      elevation: 3,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          content,
          Container(width: double.infinity, height: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25),)
              ],
            ),),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 55);
}

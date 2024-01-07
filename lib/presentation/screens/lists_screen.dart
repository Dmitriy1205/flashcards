import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text('Collections'),
        Text('Edit')
      ],)
    ],);
  }
}

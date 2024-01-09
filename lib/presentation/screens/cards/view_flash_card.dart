import 'dart:math';

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewFlashCard extends StatefulWidget {
  const ViewFlashCard({Key? key, required this.card}) : super(key: key);
  final CardEntity card;

  @override
  State<ViewFlashCard> createState() => _ViewFlashCardState();
}

class _ViewFlashCardState extends State<ViewFlashCard> {
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/left_arrow.svg',
                    height: 21,
                    width: 19,
                  ),
                ),
                const SizedBox(
                  width: 19,
                ),
                Text(
                  AppStrings.card,
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
              ]),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppStrings.done,
                  style: AppTheme.themeData.textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              color: AppColors.background,
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFlipped = !isFlipped;
                        });
                      },
                      child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOut,
                        tween: Tween(
                            begin: isFlipped ? 180.0 : 0.0,
                            end: isFlipped ? 0.0 : 180.0),
                        builder: (context, double value, child) {
                          return RotationY(
                            rotationY: value,
                            child: Card(
                                child: Container(
                                    width: 380,
                                    height: 470,
                                    color: Colors.white,
                                    child: Center(
                                      child: value >= 90
                                          ? RotationY(
                                              rotationY: value >= 90 ? 180 : 0,
                                              child: Text(widget.card.front))
                                          : Text(widget.card.back),
                                    ))),
                          );
                        },
                      ))),
            ),
          )
        ]));
  }
}

class RotationY extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationY;

  const RotationY({Key? key, required this.child, this.rotationY = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) //These are magic numbers, just use them :)
          ..rotateY(rotationY * degrees2Radians),
        child: child);
  }
}

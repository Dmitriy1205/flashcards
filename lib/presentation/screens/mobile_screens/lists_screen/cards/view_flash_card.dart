import 'dart:math';

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'create_edit_card.dart';

class ViewFlashCard extends StatefulWidget {
  const ViewFlashCard({Key? key, required this.card}) : super(key: key);
  final CardEntity card;

  @override
  State<ViewFlashCard> createState() => _ViewFlashCardState();
}

class _ViewFlashCardState extends State<ViewFlashCard> {
  bool isFlipped = false;
  bool disableInitialAnimation = true;

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
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppIcons.leftArrow,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateEditCard(
                                card: widget.card,
                              )));
                },
                child: Text(
                  AppStrings.edit,
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
                          disableInitialAnimation = false;
                          isFlipped = !isFlipped;
                        });
                      },
                      child: TweenAnimationBuilder(
                        duration: disableInitialAnimation
                            ? Duration(milliseconds: 0)
                            : Duration(milliseconds: 700),
                        curve: Curves.easeOut,
                        tween: Tween(
                            begin: isFlipped ? 180.0 : 0.0,
                            end: isFlipped ? 0.0 : 180.0),
                        builder: (context, double value, child) {
                          return RotationY(
                            rotationY: value,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: 380,
                                height: 470,
                                child: Center(
                                  child: RotationY(
                                    rotationY: value >= 90 ? 180 : 0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: Text(
                                        value >= 90
                                            ? widget.card.front
                                            : widget.card.back,
                                        textAlign: TextAlign.center,
                                        style: AppTheme
                                            .themeData.textTheme.headlineSmall!
                                            .copyWith(
                                          fontSize: 24,
                                          color: Color(0xFF3C39D1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ))),
            ),
          )
        ]));
  }
}

class RotationY extends StatelessWidget {
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
          ..setEntry(3, 2, 0.001)
          ..rotateY(rotationY * degrees2Radians),
        child: child);
  }
}
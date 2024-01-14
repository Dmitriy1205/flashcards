import 'dart:math';

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/widgets/app_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../blocs/cards/cards_bloc.dart';

class WebViewFlashCard extends StatefulWidget {
  const WebViewFlashCard({Key? key, required this.card}) : super(key: key);
  final CardEntity card;

  @override
  State<WebViewFlashCard> createState() => _WebViewFlashCardState();
}

class _WebViewFlashCardState extends State<WebViewFlashCard> {
  bool isFlipped = false;
  CardEntity? pickedCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 64,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                ),
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                AppStrings.card,
                style: AppTheme.themeData.textTheme.headlineLarge,
              ),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.background,
          child: Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 35.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width/3.5,
              //     color: AppColors.background,
              //     child: ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: context.read<CardsBloc>().cardsList.length,
              //         itemBuilder: (context, index) {
              //           CardEntity card =
              //               context.read<CardsBloc>().cardsList[index]['name'];
              //           return Padding(
              //             padding: const EdgeInsets.only(bottom: 36, left: 43),
              //             child: InkWell(
              //               onTap: () {
              //                 setState(() {
              //                   pickedCard = CardEntity(front: card.front, back: card.back);
              //                 });
              //
              //               },
              //               child: Container(
              //                 width: 380,
              //                 height: 148,
              //                 decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.circular(10)),
              //                 child: Padding(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 13.0),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Text(
              //                         card.front,
              //                         textAlign: TextAlign.center,
              //                         style: AppTheme
              //                             .themeData.textTheme.labelMedium!
              //                             .copyWith(
              //                                 color: AppColors.mainAccent),
              //                       ),
              //                       Text(
              //                         card.back,
              //                         style: AppTheme
              //                             .themeData.textTheme.labelSmall!
              //                             .copyWith(
              //                           color: AppColors.greenBlack,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 70.0, right: 70, top: 47, bottom: 61),
                  child: InkWell(
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
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: value >= 90
                                    ? RotationY(
                                        rotationY: value >= 90 ? 180 : 0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 38.0, right: 43),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 80,
                                              ),
                                              const Spacer(),
                                              Text(
                                               pickedCard?.front ?? widget.card.front,
                                                style: AppTheme.themeData
                                                    .textTheme.labelMedium!
                                                    .copyWith(
                                                        color: AppColors
                                                            .mainAccent),
                                              ),
                                              const Spacer(),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: AppRoundButton(
                                                  onTap: () {
                                                    router.push('/edit_card');
                                                  },
                                                  color: Colors.white,
                                                  svgIcon: AppIcons.pen,
                                                  showBorder: true,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 38.0, right: 43),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 80,
                                            ),
                                            const Spacer(),
                                            Text(
                                              pickedCard?.back ?? widget.card.back,
                                              style: AppTheme.themeData
                                                  .textTheme.labelMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColors.mainAccent),
                                            ),
                                            const Spacer(),
                                            const SizedBox(),
                                            // Align(
                                            //   alignment: Alignment.centerRight,
                                            //   child: AppRoundButton(
                                            //     onTap: () {
                                            //       //TODO: edit
                                            //     },
                                            //     color: Colors.white,
                                            //     svgIcon: AppIcons.pen,
                                            //     showBorder: true,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ),
            ],
          ),
        ));
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

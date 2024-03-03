import 'dart:math';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/images.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FinishLearningScreen extends StatefulWidget {
  const FinishLearningScreen(
      {Key? key,
      required this.known,
      required this.learning,
      required this.collectionId})
      : super(key: key);
  final int known;
  final int learning;
  final String collectionId;

  @override
  State<FinishLearningScreen> createState() => _FinishLearningScreenState();
}

class _FinishLearningScreenState extends State<FinishLearningScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            child: SvgPicture.asset(
              AppIcons.cancel,
              height: 21,
              width: 19,
            ),
            onTap: () {
              router.go('/mobile_home');
            },
          ),
          Text('${widget.known}/${widget.known + widget.learning}',
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w600)),
          const SizedBox()
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You're doing a great \n job! Keep up the \n good work!",
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 22),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 41, right: 41, bottom: 26),
                  child: CustomPaint(
                    size: const Size(118, 118),
                    // You can change this to your desired size
                    painter: MyCircularChart(
                        totalSegments: widget.known + widget.learning,
                        filledSegments: widget.known,
                        segmentGap: 2),
                  ),
                ),
                SizedBox(
                  width: 191,
                  height: 63,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Known',
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Container(
                              height: 26,
                              width: 26,
                              decoration: const BoxDecoration(
                                color: AppColors.mainAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(widget.known.toString(),
                                      style: AppTheme
                                          .themeData.textTheme.labelMedium!
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ))))
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'Still learning',
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Container(
                              height: 26,
                              width: 26,
                              decoration: const BoxDecoration(
                                color: AppColors.mainAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(widget.learning.toString(),
                                      style: AppTheme
                                          .themeData.textTheme.labelMedium!
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ))))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: SvgPicture.asset(
                AppImages.layer_2,
                height: 178,
                width: 267,
              ),
            ),
            const Spacer(),
            Center(
              child: InkWell(
                  child: Text(
                'Finish',
                style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ), onTap: (){

              }),
            ),
            SizedBox(
              height: 23,
            ),
            AppElevatedButton(
              text: 'Continue Learning',
              onPressed: () {
                showBottomMenu(
                    scaffoldKey: _scaffoldKey,
                    selectedCollectionId: widget.collectionId);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<Future> showBottomMenu(
      {required GlobalKey<ScaffoldState> scaffoldKey,
      required String selectedCollectionId}) async {
    List<CardEntity> cards =
        await context.read<CardsBloc>().getCards(selectedCollectionId);
    List<CardEntity> knownCardsList = [];
    List<CardEntity> learningCardsList = [];
    for (CardEntity card in cards) {
      if (card.isLearned) {
        knownCardsList.add(card);
      } else {
        learningCardsList.add(card);
      }
    }
    return showAdaptiveActionSheet(
      context: scaffoldKey.currentContext!,
      isDismissible: true,
      androidBorderRadius: 30,
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: Text('Learn all ${cards.length}', style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600)),
          onPressed: (context) {
            Navigator.pop(context);
            router.push(
              '/learn_cards',
              extra: {"collectionId": selectedCollectionId, "cards": cards},
            );
          },
        ),
        BottomSheetAction(
            title: Text('Only unknown ${learningCardsList.length}', style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600)),
            onPressed: (context) {
              Navigator.pop(context);
              router.push(
                '/learn_cards',
                extra: {
                  "collectionId": selectedCollectionId,
                  "cards": learningCardsList
                },
              );
            }),
        BottomSheetAction(
            title: Text('Only known ${knownCardsList.length}', style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600)),
            onPressed: (context) {
              Navigator.pop(context);
              router.push(
                '/learn_cards',
                extra: {
                  "collectionId": selectedCollectionId,
                  "cards": knownCardsList
                },
              );
            }),
      ],
      cancelAction: CancelAction(
          title: Text(
              'Cancel', style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600))), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }
}

class MyCircularChart extends CustomPainter {
  final int totalSegments;
  final int filledSegments;
  final double segmentGap; // Gap in degrees between segments

  MyCircularChart(
      {required this.totalSegments,
      required this.filledSegments,
      required this.segmentGap});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    double segmentAngle = (360 - (totalSegments * segmentGap)) / totalSegments;

    for (int i = 0; i < totalSegments; i++) {
      // Adjust color based on filled segments
      paint.color = i < filledSegments
          ? AppColors.mainAccent
          : AppColors.mainAccent.withOpacity(0.2);

      double startAngle =
          -pi / 2 + (i * (segmentAngle + segmentGap)) * (pi / 180);
      canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height),
        startAngle,
        segmentAngle * (pi / 180),
        false,
        paint,
      );
    }

    // Calculate the percentage
    final percentage = '${(filledSegments / totalSegments * 100).toInt()}%';

    // Style for the percentage text
    TextSpan span = TextSpan(
        style: AppTheme.themeData.textTheme.headlineLarge!.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        text: percentage);
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    // Position the text in the center of the canvas
    Offset textCenter =
        Offset(size.width / 2 - tp.width / 2, size.height / 2 - tp.height / 2);
    tp.paint(canvas, textCenter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

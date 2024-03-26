import 'dart:math';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/images.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../widgets/learn_dialog.dart';

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
              context
                  .read<ListsBloc>()
                  .add(ListsEvent.started(isEditMode: false));
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
              AppLocalizations.of(context)!.greatJob,
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
                Expanded(
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.known,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.themeData.textTheme.headlineLarge!
                                    .copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
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
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.stillLearning,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.themeData.textTheme.headlineLarge!
                                    .copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
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
            GestureDetector(
              onTap: () {
                router.go('/mobile_home');
                context
                    .read<ListsBloc>()
                    .add(ListsEvent.started(isEditMode: false));
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 35,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.finish,
                    style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            AppElevatedButton(
              text: AppLocalizations.of(context)!.continueLearning,
              onPressed: () {
                showBottomMenu(
                    context: context,
                    selectedCollectionId: widget.collectionId);
              },
            )
          ],
        ),
      ),
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

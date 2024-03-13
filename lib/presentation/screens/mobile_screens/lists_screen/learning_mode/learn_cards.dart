import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flashcards/presentation/widgets/quill_text.dart';
import 'package:flashcards/presentation/widgets/swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LearnCards extends StatefulWidget {
  const LearnCards({Key? key, required this.collectionId, required this.cards})
      : super(key: key);
  final String collectionId;
  final List<CardEntity> cards;

  @override
  State<LearnCards> createState() => _LearnCardsState();
}

class _LearnCardsState extends State<LearnCards> {
  final SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();
  int _index = 1;
  int learnNew = 0;
  int unknowNew = 0;
  int known = 0;
  int learning = 0;

  @override
  void initState() {
    super.initState();
    context
        .read<CardsBloc>()
        .add(CardsEvent.initCard(collectionId: widget.collectionId));

    for (CardEntity card in widget.cards) {
      if (card.isLearned) {
        known += 1;
      } else {
        learning += 1;
      }
      print('known $known learning $learning');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            height: 4.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.borderGrey, Colors.white],
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        // elevation: 8,
        backgroundColor: Colors.white,
        title: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  context
                      .read<ListsBloc>()
                      .add(const ListsEvent.started(isEditMode: false));
                  router.go('/mobile_home');
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(children: [
                    SvgPicture.asset(
                      AppIcons.cancel,
                      color: Colors.black,
                      height: 21,
                      width: 19,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      AppLocalizations.of(context)!.learn,
                      style: AppTheme.themeData.textTheme.headlineLarge,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ]),
      ),
      body: BlocConsumer<CardsBloc, CardsState>(
        listener: (context, state) async {
          state.maybeMap(
              orElse: () {},
              finishLearning: (_) {
                router.go(
                  '/finish_learn_screen',
                  extra: {
                    "collectionId": widget.collectionId,
                    "known": learnNew,
                    "learning": unknowNew
                  },
                );
              });
        },
        builder: (context, state) {
          return state.maybeMap(loading: (_) {
            return Container(
                color: AppColors.background, child: LoadingIndicator());
          }, loaded: (data) {
            if (_index > known + learning) {
              context.read<CardsBloc>().add(const CardsEvent.finishLearn());
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 26.0, right: 24, top: 20, bottom: 9),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.leftArrow,
                          height: 21,
                          width: 19,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            '$_index/${known + learning}',
                            style: AppTheme.themeData.textTheme.labelMedium!
                                .copyWith(
                              color: AppColors.mainAccent,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          AppIcons.rightArrow,
                          height: 21,
                          width: 19,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: AppColors.red, width: 2)),
                          child: Center(
                              child: Text(unknowNew.toString(),
                                  style: AppTheme
                                      .themeData.textTheme.labelMedium!
                                      .copyWith(
                                    color: AppColors.red,
                                    fontSize: 22,
                                  )))),
                      Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: AppColors.green, width: 2)),
                          child: Center(
                              child: Text(learnNew.toString(),
                                  style: AppTheme
                                      .themeData.textTheme.labelMedium!
                                      .copyWith(
                                    color: AppColors.green,
                                    fontSize: 22,
                                  ))))
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SwipeableCardsSection(
                          onCardSwiped: (dir, index, _) {
                            switch (dir) {
                              case Direction.left:
                                context.read<CardsBloc>().add(
                                    CardsEvent.swipeCard(
                                        cardEntity: widget.cards[index]
                                            .copyWith(isLearned: false)));
                                setState(() {
                                  _index += 1;
                                  unknowNew += 1;
                                });

                                break;
                              case Direction.right:
                                context.read<CardsBloc>().add(
                                    CardsEvent.swipeCard(
                                        cardEntity: widget.cards[index]
                                            .copyWith(isLearned: true)));
                                setState(() {
                                  _index += 1;
                                  learnNew += 1;
                                });
                                break;
                            }
                          },
                          cardController: _cardController,
                          context: context,
                          items: List.generate(widget.cards.length, (index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.borderGrey,
                                      blurRadius: 10,
                                    ),
                                  ],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  )),
                              child: Card(
                                // shadowColor: Colors.grey,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: FractionallySizedBox(
                                      widthFactor: 1,
                                      // Adjust the width factor as needed
                                      child: QuillText(
                                        content: widget.cards[index].front,
                                      ),
                                    ),
                                  ),
                                )),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }, error: (e) {
            return Center(
                child: Text(
              'Error $e',
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 18),
            ));
          }, orElse: () {
            return const Center(child: Text(AppStrings.noCardsLeft));
          });
        },
      ),
    );
  }
}

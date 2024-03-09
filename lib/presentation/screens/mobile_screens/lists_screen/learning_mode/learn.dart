import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../collections.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  Widget build(BuildContext context) {
    return BlocConsumer<ListsBloc, ListsState>(
      listenWhen: (previousState, state) {
        return state.maybeMap(
            orElse: () => false,
            operationSucceeded: (_) => true,
            viewCards: (_) => true);
      },
      listener: (context, state) {
        state.maybeMap(
          operationSucceeded: (_) {
            AppToast.showSuccess(context, "Success");
          },
          viewCards: (selectedCollection) {
            showBottomMenu(
                scaffoldKey: widget.scaffoldKey,
                selectedCollectionId: selectedCollection.collection.id);
          },
          orElse: () {},
        );
      },
      buildWhen: (previousState, state) {
        return state.maybeWhen(
          viewCollections: (collections, boolean, collectionList) => true,
          orElse: () => false,
        );
      },
      builder: (context, state) {
        return Container(
          child: state.maybeMap(
            loading: (_) => const CircularProgressIndicator(),
            error: (e) => Center(
                child: Text(
              'Error $e',
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 18),
            )),
            viewCollections: (collections) {
              return Collections(
                  collectionsList: collections.collectionsList,
                  isEditMode: collections.isEditMode);
            },
            orElse: () {
              return const Center(
                child: Text(AppStrings.noCollection),
              );
            },
          ),
        );
      },
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
          title: Text('Learn all ${cards.length}',
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
          onPressed: (context) {
            Navigator.pop(context);
            router.push(
              '/learn_cards',
              extra: {"collectionId": selectedCollectionId, "cards": cards},
            );
          },
        ),
        BottomSheetAction(
            title: Text('Only unknown ${learningCardsList.length}',
                style: AppTheme.themeData.textTheme.titleMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
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
            title: Text('Only known ${knownCardsList.length}',
                style: AppTheme.themeData.textTheme.titleMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
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
          title: Text('Cancel',
              style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight
                      .w600))), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }
}

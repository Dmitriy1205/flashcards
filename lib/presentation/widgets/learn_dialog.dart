import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/router.dart';
import '../../core/themes/theme.dart';
import '../../domain/entities/card_entity/card_entity.dart';
import '../blocs/cards/cards_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showBottomMenu(
    {required String selectedCollectionId, required BuildContext context}) async {
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
  if(!context.mounted) return;
  return showAdaptiveActionSheet(
    context: context,
    isDismissible: true,
    androidBorderRadius: 30,
    actions: [
      cards.isEmpty ? null : BottomSheetAction(
        title: Text('${AppLocalizations.of(context)!.learnAll} ${cards.length}',
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
      learningCardsList.isEmpty ? null : BottomSheetAction(
          title: Text('${AppLocalizations.of(context)!.onlyUnknown} ${learningCardsList.length}',
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
      knownCardsList.isEmpty ? null : BottomSheetAction(
          title: Text('${AppLocalizations.of(context)!.onlyKnown} ${knownCardsList.length}',
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
    ].whereType<BottomSheetAction>().toList(),
    cancelAction: CancelAction(
        title: Text(AppLocalizations.of(context)!.cancel,
            style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight
                    .w600))), // onPressed parameter is optional by default will dismiss the ActionSheet
  );
}
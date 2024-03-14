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
import '../../../../widgets/learn_dialog.dart';
import '../collections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
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
            AppToast.showSuccess(context, AppLocalizations.of(context)!.success);
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
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (e) => Center(
                child: Text(
              'Error $e',
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 18),
            )),
            viewCollections: (collections) {
              return Collections(
                  onTileTap: (el){
                    showBottomMenu(
                        context: context,
                        selectedCollectionId: el.id);
                  },
                  collectionsList: collections.collectionsList,
                  isEditMode: collections.isEditMode);
            },
            orElse: () {
              return Center(
                child: Text(AppLocalizations.of(context)!.noCollection),
              );
            },
          ),
        );
      },
    );
  }
}



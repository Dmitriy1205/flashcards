import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'collections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
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
          operationSucceeded: (_){
            AppToast.showSuccess(context, AppLocalizations.of(context)!.success);
          },
          viewCards: (selectedCollection) {
            router.push(
              '/cards',
              extra: {
                "collectionName": selectedCollection.collection.collectionName,
                "collectionId": selectedCollection.collection.id,
              },
            );
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
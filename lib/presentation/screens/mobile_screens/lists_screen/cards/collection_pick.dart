import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_contract.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/collections.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/lists_screen.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/const/icons.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CollectionPick extends StatelessWidget {
  CollectionPick({Key? key, this.move = true}) : super(key: key){
    _bloc.add(const ListsEvent.started(isEditMode: false));
  }

  ///'move' if true, otherwise 'copy'
  final bool move;
  final ListsBloc _bloc = ListsBloc(collectionRepo: sl<CollectionRepoContract>());


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListsBloc,ListsState>(
      bloc: _bloc,
      builder: (context,state) => Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(children: [
                            SvgPicture.asset(
                              AppIcons.leftArrow,
                              color: Colors.black,
                              height: 21,
                              width: 19,
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Text(
                              move ? "Move to" : "Copy to",
                              style: AppTheme.themeData.textTheme.headlineLarge,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: state.maybeMap(
              initial: (_) => Center(child: LoadingIndicator(),),
              loading: (_) => Center(child: LoadingIndicator(),),
              viewCollections: (state) => Collections(collectionsList: state.collectionsList, isEditMode: false, onTileTap: (collection){
                Navigator.of(context).pop(collection.id);
              },),
              orElse: () => SizedBox.shrink())),
    );
  }
}

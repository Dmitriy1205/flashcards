import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/data/remote/empty.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebCollections extends StatefulWidget {
  const WebCollections({Key? key, required this.collectionsList})
      : super(key: key);
  final List<CollectionEntity> collectionsList;

  @override
  State<WebCollections> createState() => _WebCollectionsState();
}

class _WebCollectionsState extends State<WebCollections> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ListView.builder(
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 11, top: 11),
              child: Row(children: [
                context.read<ListsBloc>().isEditMode
                    ? Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            context
                                .watch<ListsBloc>()
                                .listIdToDelete
                                .add(widget.collectionsList[i]);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: context
                                      .watch<ListsBloc>()
                                      .listIdToDelete
                                      .contains(widget.collectionsList[i].id)
                                  ? const Icon(
                                      Icons.check_circle,
                                      size: 23.0,
                                      color: AppColors.mainAccent,
                                    )
                                  : const Icon(
                                      Icons.radio_button_unchecked,
                                      size: 23.0,
                                      color: AppColors.mainAccent,
                                    ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: context.read<ListsBloc>().isEditMode ? 22 : 0,
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      onTap: () {
                        context
                            .read<ListsBloc>()
                            .add(ListsEvent.selectCollection(
                              collectionsListName:
                                  widget.collectionsList[i].collectionName,
                            ));
                      },
                      contentPadding:
                          const EdgeInsets.only(left: 28, right: 33),
                      title: Text(
                        widget.collectionsList[i].collectionName,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                      subtitle: Text(
                        '${MockData.cardsList.length.toString()} ${AppStrings.cards.toLowerCase()}',
                        style:
                            AppTheme.themeData.textTheme.labelSmall!.copyWith(
                          color: AppColors.mainAccent,
                        ),
                      ),
                      trailing: const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: AppColors.mainAccent,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ]),
            );
          },
          itemCount: widget.collectionsList.length),
    );
  }
}

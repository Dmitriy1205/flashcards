import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Collections extends StatelessWidget {
  const Collections(
      {Key? key, required this.collectionsList, required this.isEditMode})
      : super(key: key);
  final List<CollectionEntity> collectionsList;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: AppColors.background,
            child: ListView.builder(
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 11, top: 11),
                    child: Row(children: [
                      isEditMode
                          ? Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  if (context
                                      .read<ListsBloc>()
                                      .listIdToDelete
                                      .contains(collectionsList[i].id)) {
                                    context
                                        .read<ListsBloc>()
                                        .listIdToDelete
                                        .remove(collectionsList[i].id);
                                  } else {
                                    context
                                        .read<ListsBloc>()
                                        .listIdToDelete
                                        .add(collectionsList[i].id);
                                  }
                                  context
                                      .read<ListsBloc>()
                                      .add(ListsEvent.started(
                                        isEditMode: isEditMode,
                                      ));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: context
                                            .read<ListsBloc>()
                                            .listIdToDelete
                                            .contains(collectionsList[i].id)
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
                        width: isEditMode ? 22 : 0,
                      ),
                      Flexible(
                        flex: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            onTap: () {
                              context
                                  .read<ListsBloc>()
                                  .add(ListsEvent.selectCollection(
                                    collection: collectionsList[i],
                                  ));
                            },
                            title: Text(
                              collectionsList[i].collectionName,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            subtitle: Text(
                              '${collectionsList[i].cards.toString()} ${AppStrings.cards.toLowerCase()}',
                              style: AppTheme.themeData.textTheme.labelSmall!
                                  .copyWith(
                                color: AppColors.mainAccent,
                              ),
                            ),
                            trailing: SvgPicture.asset(
                              AppIcons.rightArrow,
                              height: 18,
                              width: 9,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
                itemCount: collectionsList.length),
          ),
        ),
      ],
    );
  }
}

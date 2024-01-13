import 'dart:async';
import 'package:async/async.dart';
import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/widgets/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key, required this.collectionsList})
      : super(key: key);
  final List<Map<String, dynamic>> collectionsList;

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
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
                      context.watch<ListsBloc>().isEditMode
                          ? Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  widget.collectionsList[i]
                                          ['toDelete'] =
                                      !widget
                                          .collectionsList[i]['toDelete'];
                                  setState(() {
                                    print('setstate');
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: widget
                                            .collectionsList[i]['toDelete']
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<ListsBloc>()
                                  .add(ListsEvent.selectCollection(
                                    collectionsListName: widget
                                        .collectionsList[i]['name'],
                                  ));
                            },
                            child: ListTile(
                              title: Text(
                                widget.collectionsList[i]
                                    ['name'],
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(fontSize: 18),
                              ),
                              subtitle: Text(
                                '${context.read<CardsBloc>().cardsList.length.toString()} ${AppStrings.cards.toLowerCase()}',
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
                      ),
                    ]),
                  );
                },
                itemCount: widget.collectionsList.length),
          ),
        ),
      ],
    );
  }
}

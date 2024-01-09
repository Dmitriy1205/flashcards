import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/lists_screen/collections.dart';
import 'package:flashcards/presentation/screens/cards/view_flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../cards/cards.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            // SafeArea(
            //     child: Container(
            //       color: Colors.white,
            //       height: 54,
            //     )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  AppStrings.collections,
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ListsBloc>().isEditMode =
                        !context.read<ListsBloc>().isEditMode;
                    setState(() {});
                  },
                  child: Text(
                    context.watch<ListsBloc>().isEditMode
                        ? AppStrings.cancel
                        : AppStrings.edit,
                    style: AppTheme.themeData.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: BlocConsumer<ListsBloc, ListsState>(
        listener: (context, state) {
          state.maybeMap(
              newList: (_) {},
              viewCards: (selectedCollection) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cards(
                              collectionName:
                                  selectedCollection.collectionsListName,
                            )));
              },
              orElse: () {
                print('Error in bloclistener');
              });
        },
        builder: (context, state) {
          return state.maybeMap(initial: (_) {
            return Collections();
          }, newList: (_) {
            return Collections();
          }, viewCards: (_) {
            return Collections();
          }, orElse: () {
            return const Center(
              child: Text(AppStrings.noCollection),
            );
          });
        },
      ),
      floatingActionButton: context.watch<ListsBloc>().isEditMode
          ? GestureDetector(
              onTap: () {
                context
                    .read<ListsBloc>()
                    .add(const ListsEvent.deleteSelectedCollection());
                context.read<ListsBloc>().isEditMode = false;
              },
              child: SizedBox(
                height: 76,
                width: 76,
                child: SvgPicture.asset(
                  'assets/icons/red_bucket.svg',
                  height: 18,
                  width: 9,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Text(
                              AppStrings.newList,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Text(AppStrings.giveMe,
                                style: AppTheme.themeData.textTheme.labelSmall!
                                    .copyWith(color: AppColors.mainAccent))
                          ],
                        ),
                        content: TextField(
                          controller: nameTextEditingController,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: AppTheme
                                  .themeData.textTheme.labelMedium!
                                  .copyWith(
                                      color: AppColors.mainAccent,
                                      fontWeight: FontWeight.w700),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          TextButton(
                            child: Text(AppStrings.create,
                                style: AppTheme.themeData.textTheme.labelMedium!
                                    .copyWith(color: AppColors.mainAccent)),
                            onPressed: () {
                              if (nameTextEditingController.text.isNotEmpty) {
                                context.read<ListsBloc>().add(
                                    ListsEvent.createNewList(
                                        name: nameTextEditingController.text));
                                Navigator.of(context).pop();
                              }
                            },
                          )
                        ],
                      );
                    });
              },
              child: SizedBox(
                height: 76,
                width: 76,
                child: SvgPicture.asset(
                  'assets/icons/floating_action_button.svg',
                  height: 18,
                  width: 9,
                ),
              ),
            ),
    );
  }
}

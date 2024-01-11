import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/auth/auth_bloc.dart';
import 'cards/cards.dart';
import 'collections.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListsBloc, ListsState>(listener: (context, state) {
      state.maybeMap(viewCards: (selectedCollection) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Cards(
                      collectionName: selectedCollection.collectionsListName,
                    )));
      }, orElse: () {
        print('Error in bloclistener');
      });
    }, builder: (context, state) {
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
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.logout());
                        },
                        child: Text(
                          'logout',
                          style: TextStyle(color: Colors.black),
                        )),
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
        body: state.maybeMap(initial: (_) {
          return Collections();
        }, viewCards: (_) {
          return Collections();
        }, orElse: () {
          return const Center(
            child: Text(AppStrings.noCollection),
          );
        }),
        floatingActionButton: context.watch<ListsBloc>().isEditMode
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
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
                      AppIcons.redBucket,
                      height: 18,
                      width: 9,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    dialog();
                  },
                  child: SizedBox(
                    height: 76,
                    width: 76,
                    child: SvgPicture.asset(
                      AppIcons.addCollection,
                      height: 18,
                      width: 9,
                    ),
                  ),
                ),
              ),
      );
    });
  }

  Future dialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12,bottom: 12),
              child: SizedBox(height: 178,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            AppIcons.leftArrow,
                            height: 12,
                            width: 6,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.newCollection,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(AppStrings.giveName,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(color: AppColors.mainAccent)),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(height: 45,
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        style: AppTheme.themeData.textTheme.labelMedium!.copyWith(
                            color: AppColors.mainAccent,
                            fontWeight: FontWeight.w700),
                        controller: nameTextEditingController,
                        decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      child: Text(AppStrings.save,
                          style: AppTheme.themeData.textTheme.labelMedium!
                              .copyWith(color: AppColors.mainAccent)),
                      onPressed: () {
                        if (nameTextEditingController.text.isNotEmpty) {
                          context.read<ListsBloc>().add(ListsEvent.createNewList(
                              name: nameTextEditingController.text));
                          nameTextEditingController.clear();
                          Navigator.of(context).pop();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

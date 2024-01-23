import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CreateEditCollectionDialog {
  CreateEditCollectionDialog({Key? key});

  final TextEditingController nameTextEditingController =
      TextEditingController();

  Future<void> dialog(BuildContext context,
      {String? collectionName, String? collectionId}) {
    collectionName != null
        ? nameTextEditingController.text = collectionName
        : null;
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 12, right: 12, bottom: 12),
              child: SizedBox(
                height: 178,
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
                              collectionName == null
                                  ? AppStrings.newCollection
                                  : AppStrings.renameCollection,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                        collectionName == null
                            ? AppStrings.giveName
                            : AppStrings.renameCollectionSubTitle,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(color: AppColors.mainAccent)),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        style: AppTheme.themeData.textTheme.labelMedium!
                            .copyWith(
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
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      child: Text(AppStrings.save,
                          style: AppTheme.themeData.textTheme.labelMedium!
                              .copyWith(color: AppColors.mainAccent)),
                      onPressed: () {
                        if (nameTextEditingController.text.isNotEmpty) {
                          if (collectionName == null) {
                            context.read<ListsBloc>().add(
                                ListsEvent.createNewList(
                                    name: nameTextEditingController.text));
                          } else {
                            context.read<ListsBloc>().add(
                                ListsEvent.editListName(
                                    name: nameTextEditingController.text,
                                    id: collectionId!));
                            context.read<ListsBloc>().listIdToDelete.clear();
                            context.read<ListsBloc>().add(ListsEvent.started(
                                isEditMode:
                                !context.read<ListsBloc>().isEditMode));
                          }
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

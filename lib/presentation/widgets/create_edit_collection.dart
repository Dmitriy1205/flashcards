import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, top: 12, right: 12),
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
                                  ? AppLocalizations.of(context)!.newCollection
                                  : AppLocalizations.of(context)!.renameCollection,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                        collectionName == null
                            ? AppLocalizations.of(context)!.giveName
                            : AppLocalizations.of(context)!.renameCollectionSubTitle,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(color: Colors.black)),
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
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                        controller: nameTextEditingController,
                        decoration: InputDecoration(
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.mainAccent.withOpacity(0.15)
                              ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.mainAccent.withOpacity(0.15)
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    SizedBox(
                      height: 46,
                      child: TextButton(
                        child: Text(AppLocalizations.of(context)!.save,
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

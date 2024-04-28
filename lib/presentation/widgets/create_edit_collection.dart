import 'dart:io';

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utils/app_toast.dart';

class CreateEditCollectionDialog {
  CreateEditCollectionDialog({Key? key});

  Future<void> dialog(BuildContext context,
      {String? collectionName, String? collectionId}) {
    return showDialog(
        context: context,
        builder: (_) {
          if(Platform.isAndroid){
            return _DialogWithTextFieldAndroid(collectionName: collectionName, collectionId: collectionId,);
          }else{
            return _DialogWithTextFieldIOS(collectionName: collectionName, collectionId: collectionId,);
          }
        });
  }
}

class _DialogWithTextFieldAndroid extends StatelessWidget {
  final String? collectionName;
  final String? collectionId;

  _DialogWithTextFieldAndroid({this.collectionId, this.collectionName});

  late final nameTextEditingController =
  TextEditingController(text: collectionName ?? '');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      title: Text(
          collectionName == null
              ? AppLocalizations.of(context)!.newCollection
              : AppLocalizations.of(context)!.renameCollection,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(collectionName == null
              ? AppLocalizations.of(context)!.giveName
              : AppLocalizations.of(context)!.renameCollectionSubTitle),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 45,
            child: Material(
              color: Colors.transparent,
              child: TextField(
                controller: nameTextEditingController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: AppTheme.themeData.textTheme.labelMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.04),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.12)),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15))),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.12)),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15)))),
              ),
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.symmetric(vertical: 12),
      actions: [
        GestureDetector(
          onTap: () {
            if(nameTextEditingController.text.isEmpty) return;
            if(context.read<ListsBloc>().state.collectionsList!.any((element) => element.collectionName == nameTextEditingController.text )){
              AppToast.showError(context, AppLocalizations.of(context)!.collectionExists);
              Navigator.of(context).pop();
              return;
            }
            if(collectionName == null){
              context.read<ListsBloc>().add(
                  ListsEvent.createNewList(
                      name: nameTextEditingController.text));
            }else{
              context.read<ListsBloc>().add(ListsEvent.editListName(
                  name: nameTextEditingController.text, id: collectionId!));
              context.read<ListsBloc>().listIdToDelete.clear();
              context.read<ListsBloc>().add(ListsEvent.started(
                  isEditMode: !context.read<ListsBloc>().isEditMode));
            }
            nameTextEditingController.clear();
            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context)!.save,
            style: const TextStyle(color: AppColors.mainAccent),
          ),
        )
      ],
    );
  }
}

class _DialogWithTextFieldIOS extends StatelessWidget {
  final String? collectionName;
  final String? collectionId;

  _DialogWithTextFieldIOS({this.collectionId, this.collectionName});

  late final nameTextEditingController =
  TextEditingController(text: collectionName ?? '');

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(collectionName == null
          ? AppLocalizations.of(context)!.newCollection
          : AppLocalizations.of(context)!.renameCollection),
      content: Column(
        children: [
          Text(collectionName == null
              ? AppLocalizations.of(context)!.giveName
              : AppLocalizations.of(context)!.renameCollectionSubTitle),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 45,
            child: Material(
              color: Colors.transparent,
              child: TextField(
                controller: nameTextEditingController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                style: AppTheme.themeData.textTheme.labelMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.04),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.12)),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15))),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.12)),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15)))),
              ),
            ),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            if(nameTextEditingController.text.isEmpty) return;
            if(context.read<ListsBloc>().state.collectionsList!.any((element) => element.collectionName == nameTextEditingController.text )){
              AppToast.showError(context, AppLocalizations.of(context)!.collectionExists);
              Navigator.of(context).pop();
              return;
            }
            if(collectionName == null){
              context.read<ListsBloc>().add(
                  ListsEvent.createNewList(
                      name: nameTextEditingController.text));
            }else{
              context.read<ListsBloc>().add(ListsEvent.editListName(
                  name: nameTextEditingController.text, id: collectionId!));
              context.read<ListsBloc>().listIdToDelete.clear();
              context.read<ListsBloc>().add(ListsEvent.started(
                  isEditMode: !context.read<ListsBloc>().isEditMode));
            }
            nameTextEditingController.clear();
            Navigator.of(context).pop();
          },
          textStyle: const TextStyle(color: AppColors.mainAccent),
          child: Text(AppLocalizations.of(context)!.save),
        )
      ],
    );
  }
}

/*
* Dialog(
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
          )*/

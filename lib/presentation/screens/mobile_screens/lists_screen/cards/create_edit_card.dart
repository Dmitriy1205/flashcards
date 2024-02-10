import 'dart:async';
import 'dart:developer';

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/svg.dart';

class CreateEditCard extends StatefulWidget {
  const CreateEditCard({Key? key, this.cardEntity, required this.collectionId})
      : super(key: key);
  final CardEntity? cardEntity;
  final String collectionId;

  @override
  State<CreateEditCard> createState() => _CreateEditCardState();
}

class _CreateEditCardState extends State<CreateEditCard> {
  late final _frontController = widget.cardEntity != null ? QuillController(document: Document.fromJson(widget.cardEntity!.front), selection: const TextSelection(baseOffset: 0, extentOffset: 0)) : QuillController.basic();
  late final _backController = widget.cardEntity != null ? QuillController(document: Document.fromJson(widget.cardEntity!.back), selection: const TextSelection(baseOffset: 0, extentOffset: 0)) : QuillController.basic();

  final _frontFocusNode = FocusNode();
  final _backFocusNode = FocusNode();

  late final StreamSubscription _frontControllerValueChanged;
  late final StreamSubscription _backControllerValueChanged;

  final KeyboardVisibilityController _keyboardVisibilityController =
      KeyboardVisibilityController();
  late final StreamSubscription<bool> _keyboardVisibilityStreamSubscription;

  bool _showKeyboardFront = false;
  bool _showKeyboardBack = false;

  List<Map<String,dynamic>> get frontText => _frontController.document.toDelta().toJson();

  List<Map<String,dynamic>> get backText => _backController.document.toDelta().toJson();

  int textLengthFront = 0;
  int textLengthBack = 0;

  int maxLength = 400;

  void _frontControllerChanged(){
    int length = _frontController.document.toPlainText().length - 1;
    if(length > maxLength){
      _frontController.replaceText(maxLength, length - maxLength, '', TextSelection.collapsed(offset: maxLength));
    }else{
      setState(() {
        textLengthFront = length;
      });
    }
  }

  void _backControllerChanged(){
    int length = _backController.document.toPlainText().length - 1;
    if(length > maxLength){
      _backController.replaceText(maxLength, length - maxLength, '', TextSelection.collapsed(offset: maxLength));
    }else{
      setState(() {
        textLengthBack = length;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _frontControllerValueChanged = _frontController.document.documentChangeObserver.stream.listen((e){
      _frontControllerChanged();
    });
    _backControllerValueChanged = _backController.document.documentChangeObserver.stream.listen((e) {
      _backControllerChanged();
    });
    _backController.addListener(_backControllerChanged);
    _keyboardVisibilityStreamSubscription =
        _keyboardVisibilityController.onChange.listen((visible) {
      if (visible) {
        _updateFocus();
      } else {
        _removeFocus();
      }
    });
    _frontFocusNode.addListener(_updateFocus);
    _backFocusNode.addListener(_updateFocus);
  }

  void _updateFocus() {
    setState(() {
      _showKeyboardFront = _frontFocusNode.hasFocus;
      _showKeyboardBack = _backFocusNode.hasFocus;
    });
  }

  void _removeFocus() {
    setState(() {
      _showKeyboardBack = false;
      _showKeyboardFront = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _frontFocusNode.unfocus();
          _backFocusNode.unfocus();
        });
      },
      child: BlocListener<CardsBloc, CardsState>(
        listener: (context, state) {
          state.maybeMap(
              loaded: (state) {
                AppToast.showSuccess(context, "Success");
                if (widget.cardEntity != null) {
                  router.pushReplacement(
                    '/view_card_mobile',
                    extra: {
                      "card": widget.cardEntity!.copyWith(
                        front: frontText,
                        back: backText,
                      ),
                      "collectionId": widget.collectionId,
                    },
                  );
                } else {
                  Navigator.pop(context);
                  context
                      .read<ListsBloc>()
                      .add(const ListsEvent.started(isEditMode: false));
                }
              },
              error: (e) {
                AppToast.showError(context, e.error);
              },
              orElse: () {});
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: () {
                if (widget.cardEntity != null) {
                  router.pushReplacement(
                    '/view_card_mobile',
                    extra: {
                      "card": widget.cardEntity!.copyWith(
                        front: frontText,
                        back: backText,
                      ),
                      "collectionId": widget.collectionId,
                    },
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(children: [
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
                        widget.cardEntity == null
                            ? '${AppStrings.create} ${AppStrings.card.toLowerCase()}'
                            : '${AppStrings.edit} ${AppStrings.card.toLowerCase()}',
                        style: AppTheme.themeData.textTheme.headlineLarge,
                      ),
                    ]),
                    TextButton(
                      onPressed: () {
                        if (frontText.isNotEmpty && backText.isNotEmpty) {
                          if (widget.cardEntity == null) {
                            CreateCardParam card = CreateCardParam(
                                front: frontText,
                                back: backText,
                                collectionId: widget.collectionId);
                            context.read<CardsBloc>().add(
                                CardsEvent.createNewCard(
                                    cardParam: card,
                                    collectionId: widget.collectionId));
                          } else {
                            EditCardParam card = EditCardParam(
                                front: frontText,
                                back: backText,
                                collectionId: widget.collectionId,
                                id: widget.cardEntity!.id);
                            context.read<CardsBloc>().add(CardsEvent.editCard(
                                cardParam: card,
                                collectionId: widget.collectionId));
                          }
                        } else {
                          AppToast.showError(
                              context, AppStrings.errorEmptyCard);
                        }
                      },
                      child: Text(
                        AppStrings.done,
                        style:
                            AppTheme.themeData.textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    frontEditor(),
                    backEditor(),
                  ],
                ),
              ),
              _showKeyboardFront
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Material(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: QuillToolbar.simple(
                              configurations: QuillSimpleToolbarConfigurations(
                                  buttonOptions: const QuillSimpleToolbarButtonOptions(
                                      base: QuillToolbarBaseButtonOptions(
                                          iconTheme: QuillIconTheme(
                                              iconButtonSelectedData: IconButtonData(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          AppColors
                                                              .mainAccent)))))),
                                  controller: _frontController,
                                  toolbarIconAlignment: WrapAlignment.start,
                                  showAlignmentButtons: false,
                                  showCenterAlignment: false,
                                  showBackgroundColorButton: false,
                                  showClearFormat: false,
                                  showDividers: false,
                                  showFontSize: false,
                                  showHeaderStyle: false,
                                  showCodeBlock: false,
                                  showColorButton: false,
                                  showDirection: false,
                                  showFontFamily: false,
                                  showIndent: false,
                                  showInlineCode: false,
                                  showJustifyAlignment: false,
                                  showLeftAlignment: false,
                                  showLink: false,
                                  showListCheck: false,
                                  showRedo: false,
                                  showUndo: false,
                                  showRightAlignment: false,
                                  showQuote: false,
                                  showSearchButton: false,
                                  showStrikeThrough: false,
                                  showSubscript: false,
                                  showSuperscript: false),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              _showKeyboardBack
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Material(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: QuillToolbar.simple(
                              configurations: QuillSimpleToolbarConfigurations(
                                  controller: _backController,
                                  buttonOptions: const QuillSimpleToolbarButtonOptions(
                                      base: QuillToolbarBaseButtonOptions(
                                          iconTheme: QuillIconTheme(
                                              iconButtonSelectedData: IconButtonData(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              AppColors
                                                                  .mainAccent)))))),
                                  toolbarIconAlignment: WrapAlignment.start,
                                  showAlignmentButtons: false,
                                  showCenterAlignment: false,
                                  showBackgroundColorButton: false,
                                  showClearFormat: false,
                                  showDividers: false,
                                  showFontSize: false,
                                  showHeaderStyle: false,
                                  showCodeBlock: false,
                                  showColorButton: false,
                                  showDirection: false,
                                  showFontFamily: false,
                                  showIndent: false,
                                  showInlineCode: false,
                                  showJustifyAlignment: false,
                                  showLeftAlignment: false,
                                  showLink: false,
                                  showListCheck: false,
                                  showRedo: false,
                                  showUndo: false,
                                  showRightAlignment: false,
                                  showQuote: false,
                                  showSearchButton: false,
                                  showStrikeThrough: false,
                                  showSubscript: false,
                                  showSuperscript: false),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget frontEditor() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 12, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 12),
            child: Text(
              AppStrings.front,
              style: AppTheme.themeData.textTheme.titleMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                    minHeight: 160,
                    controller: _frontController,
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4)),
                focusNode: _frontFocusNode,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLengthFront/$maxLength'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // _getImages();
                },
                child: SvgPicture.asset(
                  AppIcons.addImage,
                  height: 76,
                  width: 76,
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset(
                AppIcons.edit2,
                height: 76,
                width: 76,
              ),
            ],
          ),
          // CustomTextInput(
          //     textEditingController: frontTextEditingController)
        ],
      ),
    );
  }

  Widget backEditor() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 72, top: 12, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 12),
            child: Text(
              AppStrings.back,
              style: AppTheme.themeData.textTheme.titleMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _backController,
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  minHeight: 160,
                ),
                focusNode: _backFocusNode,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLengthBack/$maxLength'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // _getImages();
                },
                child: SvgPicture.asset(
                  AppIcons.addImage,
                  height: 76,
                  width: 76,
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset(
                AppIcons.edit2,
                height: 76,
                width: 76,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _frontController.removeListener(_updateFocus);
    _backController.removeListener(_updateFocus);
    _frontControllerValueChanged.cancel();
    _backControllerValueChanged.cancel();
    _frontController.dispose();
    _backController.dispose();
    _keyboardVisibilityStreamSubscription.cancel();
    super.dispose();
  }
}

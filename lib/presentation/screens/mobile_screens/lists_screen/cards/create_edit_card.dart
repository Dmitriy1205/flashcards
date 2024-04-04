import 'dart:async';
import 'dart:convert';
import 'dart:ui';
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
import 'package:flashcards/presentation/blocs/full_card/full_card_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flashcards/presentation/widgets/painting_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/services/service_locator.dart';

class CreateEditCard extends StatefulWidget {
  CreateEditCard({Key? key, this.cardEntity, required this.collectionId})
      : super(key: key);
  final CardEntity? cardEntity;
  final String collectionId;

  @override
  State<CreateEditCard> createState() => CreateEditCardState();
}

class CreateEditCardState extends State<CreateEditCard> {
  String frontImageBase64 = '';
  String backImageBase64 = '';

  Image? frontImage;
  Image? backImage;

  void changeFrontImage(String? imageBase64){
    if(imageBase64 == null){
      setState(() {
        frontImageBase64 = '';
        frontImage = null;
      });
    }else{
      setState(() {
        frontImageBase64 = imageBase64;
        frontImage = Image.memory(base64Decode(imageBase64), fit: BoxFit.fill,);
      });
    }
  }

  void changeBackImage(String? imageBase64){
    if(imageBase64 == null){
      setState(() {
        backImageBase64 = '';
        backImage = null;
      });
    }else{
      setState(() {
        backImageBase64 = imageBase64;
        backImage = Image.memory(base64Decode(imageBase64), fit: BoxFit.fill,);
      });
    }
  }

  Color _selectedColor = Colors.black;
  final GlobalKey<PaintingAreaState> _signatureKey =
      GlobalKey<PaintingAreaState>();

  final ScrollController _scrollController = ScrollController();
  late final _frontController = widget.cardEntity != null
      ? QuillController(
          document: Document.fromJson(widget.cardEntity!.front),
          selection: const TextSelection(baseOffset: 0, extentOffset: 0))
      : QuillController.basic();
  late final _backController = widget.cardEntity != null
      ? QuillController(
          document: Document.fromJson(widget.cardEntity!.back),
          selection: const TextSelection(baseOffset: 0, extentOffset: 0))
      : QuillController.basic();

  final _frontFocusNode = FocusNode();
  final _backFocusNode = FocusNode();

  final _backKey = GlobalKey();
  final _frontKey = GlobalKey();

  late final StreamSubscription _frontControllerValueChanged;
  late final StreamSubscription _backControllerValueChanged;

  final KeyboardVisibilityController _keyboardVisibilityController =
      KeyboardVisibilityController();
  late final StreamSubscription<bool> _keyboardVisibilityStreamSubscription;

  bool _showKeyboardFront = false;
  bool _showKeyboardBack = false;

  List<Map<String, dynamic>> get frontText =>
      _frontController.document.toDelta().toJson();

  List<Map<String, dynamic>> get backText =>
      _backController.document.toDelta().toJson();

  int textLengthFront = 0;
  int textLengthBack = 0;

  int maxLength = 400;

  final _fullCardBloc = sl<FullCardBloc>();

  void _frontControllerChanged() {
    int length = _frontController.document.toPlainText().length - 1;
    if (length > maxLength) {
      _frontController.replaceText(maxLength, length - maxLength, '',
          TextSelection.collapsed(offset: maxLength));
    } else {
      setState(() {
        textLengthFront = length;
      });
    }
  }

  void _backControllerChanged() {
    int length = _backController.document.toPlainText().length - 1;
    if (length > maxLength) {
      _backController.replaceText(maxLength, length - maxLength, '',
          TextSelection.collapsed(offset: maxLength));
    } else {
      setState(() {
        textLengthBack = length;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.cardEntity != null) {
      _fullCardBloc
          .add(FullCardEvent.fetchFullInformation(card: widget.cardEntity!));
    }

    _frontControllerValueChanged =
        _frontController.document.documentChangeObserver.stream.listen((e) {
          _frontControllerChanged();
        });
    _backControllerValueChanged =
        _backController.document.documentChangeObserver.stream.listen((e) {
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

    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;

      if (_showKeyboardFront) {
        setState(() {
          _scrollController.animateTo(0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300));
        });
      } else if (_showKeyboardBack) {
        Scrollable.ensureVisible(_backKey.currentContext!);
      }
    });
  }

  void _removeFocus() {
    setState(() {
      _showKeyboardBack = false;
      _showKeyboardFront = false;
    });
    setState(() {
      _scrollController.animateTo(0,
          curve: Curves.easeOut, duration: const Duration(milliseconds: 300));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FullCardBloc, FullCardState>(
      bloc: _fullCardBloc,
      listener: (context, fullCardState) {
        if (widget.cardEntity != null) {
          changeFrontImage(fullCardState.card!.base64FrontImage);
          changeBackImage(fullCardState.card!.base64BackImage);
        }
        _frontControllerChanged();
        _backControllerChanged();
      },
      builder: (context, fullCardState) => GestureDetector(
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
                  AppToast.showSuccess(
                      context, AppLocalizations.of(context)!.success);
                  if (widget.cardEntity != null) {
                    router.pushReplacement(
                      '/view_card_mobile',
                      extra: {
                        "card": widget.cardEntity!.copyWith(
                            front: frontText,
                            back: backText),
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
                              ? '${AppLocalizations.of(context)!.create} ${AppLocalizations.of(context)!.card.toLowerCase()}'
                              : '${AppLocalizations.of(context)!.edit} ${AppLocalizations.of(context)!.card.toLowerCase()}',
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
                                  backImages: backImageBase64,
                                  frontImages: frontImageBase64,
                                  collectionId: widget.collectionId);
                              context.read<CardsBloc>().add(
                                  CardsEvent.createNewCard(
                                      cardParam: card,
                                      collectionId: widget.collectionId));
                            } else {
                              EditCardParam card = EditCardParam(
                                  front: frontText,
                                  back: backText,
                                  backImages: backImageBase64,
                                  frontImages: frontImageBase64,
                                  collectionId: widget.collectionId,
                                  id: widget.cardEntity!.id);
                              context.read<CardsBloc>().add(CardsEvent.editCard(
                                  cardParam: card,
                                  collectionId: widget.collectionId));
                            }
                          } else {
                            AppToast.showError(context,
                                AppLocalizations.of(context)!.errorEmptyCard);
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.done,
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
            body: fullCardState.card == null && widget.cardEntity != null ? const Center(child: LoadingIndicator(),) : Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
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
              AppLocalizations.of(context)!.front,
              style: AppTheme.themeData.textTheme.titleMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            key: _frontKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Stack(children: [
                QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                      minHeight: 160,
                      controller: _frontController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4)),
                  focusNode: _frontFocusNode,
                ),
                frontImageBase64.isNotEmpty
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          width: 64,
                          height: 64,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                bottom: 0,
                                width: 59,
                                height: 59,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.borderGrey),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11),
                                      child: frontImage
                                    )),
                              ),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: InkWell(
                                    onTap: () {
                                      changeFrontImage(null);
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: const Icon(Icons.highlight_remove,
                                          size: 18),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox()
              ]),
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
                onTap: () async {
                  final img = await ImagePicker()
                      .pickImage(source: ImageSource.gallery, maxWidth: 300);
                  if (img != null) {
                    final byteData = await img.readAsBytes();
                    final bytes = byteData.buffer.asUint8List();
                    if (bytes.any((e) => e != 0)) {
                      final base64 = base64Encode(bytes.toList());
                      changeFrontImage(base64);
                    }
                  }
                },
                child: SvgPicture.asset(
                  AppIcons.addImage,
                  height: 76,
                  width: 76,
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () {
                  _openDialog(context, true);
                },
                child: SvgPicture.asset(
                  AppIcons.edit2,
                  height: 76,
                  width: 76,
                ),
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
              AppLocalizations.of(context)!.back,
              style: AppTheme.themeData.textTheme.titleMedium,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            key: _backKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Stack(
                children: [
                  QuillEditor.basic(
                    configurations: QuillEditorConfigurations(
                      controller: _backController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      minHeight: 160,
                    ),
                    focusNode: _backFocusNode,
                  ),
                  backImageBase64.isNotEmpty
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          width: 64,
                          height: 64,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                bottom: 0,
                                width: 59,
                                height: 59,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.borderGrey),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11),
                                      child: backImage
                                    )),
                              ),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: InkWell(
                                    onTap: () {
                                      changeBackImage(null);
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: const Icon(Icons.highlight_remove,
                                          size: 18),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      : const SizedBox()
                ],
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
                onTap: () async {
                  final img = await ImagePicker()
                      .pickImage(source: ImageSource.gallery, maxWidth: 300);
                  if (img != null) {
                    final byteData = await img.readAsBytes();
                    final bytes = byteData.buffer.asUint8List();
                    if (bytes.any((e) => e != 0)) {
                      final base64 = base64Encode(bytes.toList());
                      changeBackImage(base64);
                    }
                  }
                },
                child: SvgPicture.asset(
                  AppIcons.addImage,
                  height: 76,
                  width: 76,
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () {
                  _openDialog(context, false);
                },
                child: SvgPicture.asset(
                  AppIcons.edit2,
                  height: 76,
                  width: 76,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openDialog(BuildContext context, bool isFront) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStateIn) {
            return Material(
              color: Colors.black26,
              child: Stack(children: [
                Positioned(
                    left: 0,
                    bottom: 85,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width + 60,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 59,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Text(
                                      'Cancel',
                                      style: AppTheme
                                          .themeData.textTheme.labelMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              color: AppColors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final img = await _signatureKey
                                          .currentState!.rendered;
                                      final byteData = await img.toByteData(
                                          format: ImageByteFormat.png);
                                      final bytes =
                                          byteData!.buffer.asUint8List();
                                      if (bytes.any((e) => e != 0)) {
                                        isFront
                                            ? changeFrontImage(base64Encode(bytes.toList()))
                                            : changeBackImage(base64Encode(bytes.toList()));
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Confirm',
                                        style: AppTheme
                                            .themeData.textTheme.labelMedium!
                                            .copyWith(
                                                fontSize: 18,
                                                color: AppColors.green)),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                child: PaintingArea(
                                  color: _selectedColor,
                                  key: _signatureKey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(15)),
                        border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Colors.black.withOpacity(0.25))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: AppColors.colors.map((color) {
                          return GestureDetector(
                            child: buildColorChoice(color, setStateIn),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 104,
                  right: 25,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _signatureKey.currentState!.back();
                        },
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.undo,
                              height: 28,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          _signatureKey.currentState!.clearSignature();
                        },
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.erase,
                              height: 28,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          });
        });
  }

  Widget buildColorChoice(Color color, Function setState) {
    return GestureDetector(
      onTap: () {
        _selectedColor = color;
        setState(() {});
      },
      child: CircleAvatar(
        backgroundColor:
            _selectedColor == color ? AppColors.mainAccent : Colors.transparent,
        radius: 15,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
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
    _scrollController.dispose();
    super.dispose();
  }
}

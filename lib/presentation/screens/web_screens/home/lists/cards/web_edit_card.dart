import 'dart:async';

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_toast.dart';
import '../../../../../../domain/params/card_param/edit_card_param.dart';
import '../../../../../blocs/cards/cards_bloc.dart';

class WebEditCard extends StatefulWidget {
  const WebEditCard({
    Key? key,
    required this.card,
  }) : super(key: key);
  final CardEntity card;

  @override
  State<WebEditCard> createState() => _WebEditCardState();
}

class _WebEditCardState extends State<WebEditCard> {
  late final _frontController = QuillController(document: Document.fromJson(widget.card.front), selection: const TextSelection(baseOffset: 0, extentOffset: 0));
  late final _backController = QuillController(document: Document.fromJson(widget.card.back), selection: const TextSelection(baseOffset: 0, extentOffset: 0));

  late final StreamSubscription _frontControllerValueChanged;
  late final StreamSubscription _backControllerValueChanged;

  final _frontFocusNode = FocusNode();
  final _backFocusNode = FocusNode();

  List<Map<String,dynamic>> get frontText => _frontController.document.toDelta().toJson();

  List<Map<String,dynamic>> get backText => _backController.document.toDelta().toJson();

  Color frontPickedColor = Colors.black;
  Color backPickedColor = Colors.black;

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardsBloc,CardsState>(
      listener: (context,state){
        state.maybeMap(
            loaded: (_){
              AppToast.showSuccess(context, "Success");
              router.pop();
            },
            error: (e){
              AppToast.showError(context, e.error);
            },
            orElse: (){});
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 64,
              ),
              InkWell(
                onTap: () {
                  router.pop();
                },
                child: const FaIcon(FontAwesomeIcons.chevronLeft),
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                '${AppStrings.edit} ${AppStrings.card.toLowerCase()}',
                style: AppTheme.themeData.textTheme.headlineLarge,
              ),
            ],
          ),
        ),
        body: Container(
          color: AppColors.background,
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 39.0,
                  horizontal: MediaQuery.of(context).size.width * 0.15),
              child: Container(
                width: 914,
                // height: MediaQuery.of(context).size.height / 1.23,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: frontEditor(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: backEditor(context),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 37.0, bottom: 25, top: 12),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              width: 86,
                              child: AppElevatedButton(
                                borderRadius: 36,
                                text: AppStrings.done,
                                onPressed: () {
                                  if (frontText.isNotEmpty &&
                                      backText.isNotEmpty) {
                                    EditCardParam card = EditCardParam(
                                        front: frontText,
                                        back: backText,
                                        collectionId: widget.card.collectionId,
                                        id: widget.card.id);
                                    context.read<CardsBloc>().add(
                                        CardsEvent.editCard(
                                            cardParam: card,
                                            collectionId:
                                                widget.card.collectionId));
                                  }else{
                                    AppToast.showError(context, AppStrings.errorEmptyCard);
                                  }
                                },
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column backEditor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Text(
            AppStrings.back,
            style: AppTheme.themeData.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(bottom: 0, top: 26, left: 24, right: 24),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: QuillToolbar.simple(
                      configurations: QuillSimpleToolbarConfigurations(controller: _backController,
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
                Container(
                  height: 1.0,
                  color: AppColors.borderGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: QuillEditor.basic(
                    configurations: QuillEditorConfigurations(
                        controller: _backController,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        minHeight: 187
                    ),
                    focusNode: _backFocusNode,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLengthBack/400'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(65)),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          AppIcons.imageIcon,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: SvgPicture.asset(
                          AppIcons.miniPlus,
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 25),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(65)),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          AppIcons.editIcon,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: SvgPicture.asset(
                          AppIcons.miniPlus,
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column frontEditor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Text(
            AppStrings.front,
            style: AppTheme.themeData.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(bottom: 0, top: 26, left: 24, right: 24),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
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
                Container(
                  height: 1.0,
                  color: AppColors.borderGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: QuillEditor.basic(
                    configurations: QuillEditorConfigurations(
                      controller: _frontController,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minHeight: 187,
                    ),
                    focusNode: _frontFocusNode,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLengthFront/400'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(65)),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          AppIcons.imageIcon,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: SvgPicture.asset(
                          AppIcons.miniPlus,
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 25),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(65)),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          AppIcons.editIcon,
                          height: 22,
                          width: 22,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: SvgPicture.asset(
                          AppIcons.miniPlus,
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> showFrontColorPicker(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width / 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlockPicker(
                        pickerColor: frontPickedColor,
                        onColorChanged: (value) {
                          setState(() {
                            frontPickedColor = value;
                          });
                        },
                      ),
                      InkWell(
                          onTap: () {
                            router.pop();
                          },
                          child: const Text('OK')),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> showBackColorPicker(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width / 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlockPicker(
                        pickerColor: backPickedColor,
                        onColorChanged: (value) {
                          setState(() {
                            backPickedColor = value;
                          });
                        },
                      ),
                      InkWell(
                          onTap: () {
                            router.pop();
                          },
                          child: const Text('OK')),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _frontControllerValueChanged.cancel();
    _backControllerValueChanged.cancel();
    _frontController.dispose();
    _backController.dispose();
    super.dispose();
  }
}

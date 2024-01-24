import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/view_flash_card.dart';
import 'package:flashcards/presentation/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CreateEditCard extends StatefulWidget {
  const CreateEditCard({Key? key, this.cardEntity, required this.collectionId})
      : super(key: key);
  final CardEntity? cardEntity;
  final String collectionId;

  @override
  State<CreateEditCard> createState() => _CreateEditCardState();
}

class _CreateEditCardState extends State<CreateEditCard> {
  final frontController = QuillEditorController();
  final backController = QuillEditorController();

  bool _frontHasFocus = false;
  bool _backHasFocus = false;

  bool _showKeyboardFront = false;
  bool _showKeyboardBack = false;

  String frontText = '';
  String backText = '';

  String textLengthFront = '0';
  String textLengthBack = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
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
                        Navigator.pop(context);

                        context.read<CardsBloc>().add(CardsEvent.createNewCard(
                            cardParam: card,
                            collectionId: widget.collectionId));
                        context
                            .read<ListsBloc>()
                            .add(const ListsEvent.started(isEditMode: false));
                      } else {
                        EditCardParam card = EditCardParam(
                            front: frontText,
                            back: backText,
                            collectionId: widget.collectionId,
                            id: widget.cardEntity!.id!);

                        router.push(
                          '/view_card_mobile',
                          extra: {
                            "card": widget.cardEntity!.copyWith(
                              front: frontText,
                              back: backText,
                            ),
                            "collectionId": widget.collectionId,
                          },
                        );

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ViewFlashCard(
                        card:
                        // widget.cardEntity!.copyWith(
                        //     front: frontTextEditingController.text,
                        //     back: backTextEditingController.text,
                        //                   ),
                        //               collectionId: widget.collectionId,
                        //             )));

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ViewFlashCard(
                        //               card: widget.cardEntity!,
                        //               collectionId: widget.collectionId,
                        //             )));
                        context.read<CardsBloc>().add(CardsEvent.editCard(
                            cardParam: card,
                            collectionId: widget.collectionId));
                      }
                    }
                  },
                  child: Text(
                    AppStrings.done,
                    style: AppTheme.themeData.textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {

          setState(() {

            _showKeyboardBack = false;
            _showKeyboardFront = false;
          });
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  frontEditor(),
                  backEditor(),
                ],
              ),
            ),
            if (_showKeyboardFront)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Material(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ToolBar(
                        mainAxisSize: MainAxisSize.min,
                        padding: const EdgeInsets.all(8),
                        toolBarColor: Colors.white,
                        iconSize: 21,
                        iconColor: AppColors.veryLightGrey,
                        activeIconColor: Colors.black,
                        controller: frontController,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        toolBarConfig: const [
                          ToolBarStyle.bold,
                          ToolBarStyle.italic,
                          ToolBarStyle.underline,
                          ToolBarStyle.listOrdered,
                          ToolBarStyle.listBullet,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (_showKeyboardBack)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Material(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ToolBar(
                        mainAxisSize: MainAxisSize.min,
                        toolBarColor: Colors.white,
                        padding: const EdgeInsets.all(8),
                        iconSize: 21,
                        iconColor: AppColors.veryLightGrey,
                        activeIconColor: Colors.black,
                        controller: backController,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        toolBarConfig: const [
                          ToolBarStyle.bold,
                          ToolBarStyle.italic,
                          ToolBarStyle.underline,
                          ToolBarStyle.listOrdered,
                          ToolBarStyle.listBullet,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Padding frontEditor() {
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
              child: QuillHtmlEditor(
                text: widget.cardEntity != null ? widget.cardEntity!.front : '',
                hintText: '',
                controller: frontController,
                isEnabled: true,
                ensureVisible: false,
                minHeight: 170,
                autoFocus: false,
                textStyle: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 17),
                hintTextAlign: TextAlign.start,
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                hintTextPadding: const EdgeInsets.only(left: 20),
                backgroundColor: Colors.white,
                inputAction: InputAction.newline,
                // onFocusChanged: (focus) {
                //
                //   setState(() {
                //     _frontHasFocus = focus;
                //
                //
                //   });
                // },
                onSelectionChanged: (_) {
                  if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
                    setState(() {
                      _showKeyboardBack = false;
                      _showKeyboardFront = true;
                    });
                  }
                },
                onTextChanged: (text) {
                  setState(() {
                    frontText = text;
                    textLengthFront = text
                        .replaceAll(RegExp(r'<[^>]*>'), '')
                        .length
                        .toString();
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLengthFront/400'),
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
              child: QuillHtmlEditor(
                text: widget.cardEntity != null ? widget.cardEntity!.back : '',
                controller: backController,
                isEnabled: true,
                ensureVisible: false,
                hintText: '',
                minHeight: 170,
                autoFocus: false,
                textStyle: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 17),
                hintTextAlign: TextAlign.start,
                padding: const EdgeInsets.only(left: 10, top: 10),
                hintTextPadding: const EdgeInsets.only(left: 20),
                backgroundColor: Colors.white,
                inputAction: InputAction.newline,
                // onFocusChanged: (focus) {
                //   setState(() {
                //     _backHasFocus = focus;
                //
                //
                //   });
                // },
                onSelectionChanged: (_) {
                  if (MediaQuery.of(context).viewInsets.bottom > 0.0) {
                    setState(() {
                      _showKeyboardFront = false;
                      _showKeyboardBack = true;
                    });
                  }
                },
                onTextChanged: (text) {
                  setState(() {
                    backText = text;
                    textLengthBack = text
                        .replaceAll(RegExp(r'<[^>]*>'), '')
                        .length
                        .toString();
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLengthBack/400'),
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
          //     textEditingController: backTextEditingController)
        ],
      ),
    );
  }

  @override
  void dispose() {
    frontController.dispose();
    backController.dispose();
    super.dispose();
  }
}

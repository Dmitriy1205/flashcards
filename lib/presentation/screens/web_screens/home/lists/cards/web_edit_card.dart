import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flashcards/presentation/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../../../../core/enum/enum.dart';
import '../../../../../../core/router/router.dart';
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
  late QuillEditorController frontController;
  late QuillEditorController backController;

  bool _frontHasFocus = false;
  bool _backHasFocus = false;

  String frontText = '';
  String backText = '';

  Color frontPickedColor = Colors.black;
  Color backPickedColor = Colors.black;

  // void unFocusEditor() => frontController.unFocus();
  //
  // final TextEditingController frontTextEditingController =
  //     TextEditingController();
  //
  // final TextEditingController backTextEditingController =
  //     TextEditingController();

  String textLengthFront = '0';
  String textLengthBack = '0';

  TextFormat currentTextFormat = TextFormat.normal;
  ParagraphFormat currentParagraphFormat = ParagraphFormat.normal;

  @override
  void initState() {
    frontController = QuillEditorController();
    backController = QuillEditorController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ColoredBox(
        color: AppColors.background,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 39.0),
              child: Container(
                width: 914,
                // height: MediaQuery.of(context).size.height / 1.23,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
                      padding: const EdgeInsets.only(
                          right: 37.0, bottom: 25, top: 12),
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
                                        front: frontText.toString(),
                                        back: backText.toString(),
                                        collectionId: widget.card.collectionId!,
                                        id: widget.card.id!);
                                    router.pop();
                                    context.read<CardsBloc>().add(
                                        CardsEvent.editCard(
                                            cardParam: card,
                                            collectionId:
                                                widget.card.collectionId!));
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
                        padding: const EdgeInsets.only(
                            bottom: 0, top: 26, left: 24, right: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderGrey),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: ToolBar(
                                    mainAxisSize: MainAxisSize.min,
                                    toolBarColor: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    iconSize: 21,
                                    iconColor: AppColors.veryLightGrey,
                                    activeIconColor: Colors.black,
                                    controller: backController,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    toolBarConfig: const [
                                      ToolBarStyle.bold,
                                      ToolBarStyle.italic,
                                      ToolBarStyle.underline,
                                      ToolBarStyle.listOrdered,
                                      ToolBarStyle.listBullet,
                                    ],
                                    customButtons: [
                                      ///color picker
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(top: 3.0),
                                      //   child: InkWell(
                                      //     child: Container(
                                      //       decoration: BoxDecoration(
                                      //           color: backPickedColor,
                                      //           borderRadius:
                                      //               BorderRadius.circular(4)),
                                      //       height: 17,
                                      //       width: 17,
                                      //     ),
                                      //     onTap: () {
                                      //       showBackColorPicker(context);
                                      //     },
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.0,
                                color: AppColors.borderGrey,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: QuillHtmlEditor(
                                  text: widget.card.back,
                                  controller: backController,
                                  isEnabled: true,
                                  ensureVisible: false,
                                  minHeight: 130,
                                  autoFocus: false,
                                  textStyle: AppTheme
                                      .themeData.textTheme.titleMedium!
                                      .copyWith(
                                          color: backPickedColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17),
                                  hintTextAlign: TextAlign.start,
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10),
                                  hintTextPadding:
                                      const EdgeInsets.only(left: 20),
                                  backgroundColor: Colors.white,
                                  inputAction: InputAction.newline,
                                  // loadingBuilder: (context) {
                                  //   return const Center(
                                  //       child: CircularProgressIndicator(
                                  //     strokeWidth: 1,
                                  //     color: Colors.red,
                                  //   ));
                                  // },
                                  onFocusChanged: (focus) {
                                    debugPrint('has focus $focus');
                                    setState(() {
                                      _backHasFocus = focus;
                                    });
                                  },
                                  onTextChanged: (text) {
                                    setState(() {
                                      backText = text;
                                      textLengthBack =
                                          text.replaceAll(RegExp(r'<[^>]*>'), '').length.toString();
                                    });
                                  },
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ToolBar(
                      mainAxisSize: MainAxisSize.min,
                      toolBarColor: Colors.white,
                      padding: const EdgeInsets.all(8),
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
                      customButtons: [
                        ///color picker
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 3.0),
                        //   child: InkWell(
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: frontPickedColor,
                        //           borderRadius: BorderRadius.circular(4)),
                        //       height: 17,
                        //       width: 17,
                        //     ),
                        //     onTap: () {
                        //       showFrontColorPicker(context);
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1.0,
                  color: AppColors.borderGrey,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: QuillHtmlEditor(
                    text: widget.card.front,
                    controller: frontController,
                    isEnabled: true,
                    ensureVisible: false,
                    minHeight: 130,
                    autoFocus: false,
                    textStyle: AppTheme.themeData.textTheme.titleMedium!
                        .copyWith(
                            color: frontPickedColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                    hintTextAlign: TextAlign.start,
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    hintTextPadding: const EdgeInsets.only(left: 20),
                    backgroundColor: Colors.white,
                    inputAction: InputAction.newline,
                    // loadingBuilder: (context) {
                    //   return const Center(
                    //       child: CircularProgressIndicator(
                    //     strokeWidth: 1,
                    //     color: Colors.red,
                    //   ));
                    // },
                    onFocusChanged: (focus) {
                      debugPrint('has focus $focus');
                      setState(() {
                        _frontHasFocus = focus;
                      });
                    },
                    onTextChanged: (text) {
                      setState(() {
                        frontText = text;
                        textLengthFront = text.replaceAll(RegExp(r'<[^>]*>'), '').length.toString();
                      });
                    },
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
    frontController.dispose();
    backController.dispose();
    super.dispose();
  }
}

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flashcards/presentation/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/enum/enum.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../domain/params/card_param/create_card_param.dart';
import '../../../../../../domain/params/card_param/edit_card_param.dart';
import '../../../../../blocs/cards/cards_bloc.dart';
import '../../../../mobile_screens/lists_screen/cards/view_flash_card.dart';

class WebCreateCard extends StatefulWidget {
  const WebCreateCard({Key? key, this.card, required this.collectionId})
      : super(key: key);
  final CardEntity? card;
  final String collectionId;

  @override
  State<WebCreateCard> createState() => _WebCreateCardState();
}

class _WebCreateCardState extends State<WebCreateCard> {
  final TextEditingController frontTextEditingController =
      TextEditingController();

  final TextEditingController backTextEditingController =
      TextEditingController();
  String textLengthFirst = '0';
  String textLengthSecond = '0';
  TextFormat currentTextFormat = TextFormat.normal;
  ParagraphFormat currentParagraphFormat = ParagraphFormat.normal;

  @override
  void initState() {
    super.initState();
    if (widget.card != null) {
      frontTextEditingController.text = widget.card!.front;
      backTextEditingController.text = widget.card!.back;
    }
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
              widget.card == null
                  ? '${AppStrings.create} ${AppStrings.card.toLowerCase()}'
                  : '${AppStrings.edit} ${AppStrings.card.toLowerCase()}',
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
                  buildInputField(
                      header: AppStrings.front,
                      controller: frontTextEditingController,
                      textLength: textLengthFirst),
                  buildInputField(
                      header: AppStrings.back,
                      controller: backTextEditingController,
                      textLength: textLengthSecond),
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
                                if (frontTextEditingController
                                        .text.isNotEmpty &&
                                    backTextEditingController.text.isNotEmpty) {
                                  if (widget.card == null) {
                                    CreateCardParam card = CreateCardParam(
                                        front: frontTextEditingController.text,
                                        back: backTextEditingController.text,
                                        collectionId: widget.collectionId);
                                    Navigator.pop(context);

                                    context.read<CardsBloc>().add(
                                        CardsEvent.createNewCard(
                                            cardParam: card,
                                            collectionId: widget.collectionId));
                                  } else {
                                    EditCardParam card = EditCardParam(
                                        front: frontTextEditingController.text,
                                        back: backTextEditingController.text,
                                        collectionId: widget.collectionId,
                                        id: widget.card!.id);
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewFlashCard(
                                                  card: widget.card!,
                                                  collectionId:
                                                      widget.collectionId,
                                                )));
                                    context.read<CardsBloc>().add(
                                        CardsEvent.editCard(
                                            cardParam: card,
                                            collectionId: widget.collectionId));
                                  }
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
    );
  }

  Padding buildInputField({
    required String header,
    required TextEditingController controller,
    required String textLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, top: 26, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              header,
              style: AppTheme.themeData.textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
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
                  child: Row(
                    children: [
                      AppIconButton(
                        svgIcon: AppIcons.big,
                        color: currentTextFormat == TextFormat.bold
                            ? Colors.black
                            : AppColors.veryLightGrey,
                        height: 22,
                        width: 22,
                        onTap: () {
                          setState(() {
                            currentTextFormat == TextFormat.bold
                                ? currentTextFormat = TextFormat.normal
                                : currentTextFormat = TextFormat.bold;
                          });
                        },
                      ),
                      AppIconButton(
                        svgIcon: AppIcons.italic,
                        color: currentTextFormat == TextFormat.italic
                            ? Colors.black
                            : AppColors.veryLightGrey,
                        height: 22,
                        width: 22,
                        onTap: () {
                          setState(() {
                            currentTextFormat == TextFormat.italic
                                ? currentTextFormat = TextFormat.normal
                                : currentTextFormat = TextFormat.italic;
                          });
                        },
                      ),
                      AppIconButton(
                        svgIcon: AppIcons.underscore,
                        color: currentTextFormat == TextFormat.underscore
                            ? Colors.black
                            : AppColors.veryLightGrey,
                        height: 22,
                        width: 22,
                        onTap: () {
                          setState(() {
                            currentTextFormat == TextFormat.underscore
                                ? currentTextFormat = TextFormat.normal
                                : currentTextFormat = TextFormat.underscore;
                          });
                        },
                      ),
                      AppIconButton(
                        svgIcon: AppIcons.numerated,
                        color: currentParagraphFormat == ParagraphFormat.number
                            ? Colors.black
                            : AppColors.veryLightGrey,
                        height: 22,
                        width: 22,
                        onTap: () {
                          setState(() {
                            currentParagraphFormat == ParagraphFormat.number
                                ? currentParagraphFormat =
                                    ParagraphFormat.normal
                                : currentParagraphFormat =
                                    ParagraphFormat.number;
                          });
                        },
                      ),
                      AppIconButton(
                        svgIcon: AppIcons.sorted,
                        color: currentParagraphFormat == ParagraphFormat.bullet
                            ? Colors.black
                            : AppColors.veryLightGrey,
                        height: 24,
                        width: 22,
                        onTap: () {
                          setState(() {
                            currentParagraphFormat == ParagraphFormat.bullet
                                ? currentParagraphFormat =
                                    ParagraphFormat.normal
                                : currentParagraphFormat =
                                    ParagraphFormat.bullet;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // BlockPicker(
                      //   pickerColor: Colors.red, //default color
                      //   onColorChanged: (Color color){ //on the color picked
                      //     print(color);
                      //   },
                      // )
                    ],
                  ),
                ),
                Container(
                  height: 1.0,
                  color: AppColors.borderGrey,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 19),
                  child: TextField(
                    controller: controller,
                    maxLines: 5,
                    style: TextStyle(
                        fontStyle: currentTextFormat == TextFormat.italic
                            ? FontStyle.italic
                            : FontStyle.normal,
                        fontWeight: currentTextFormat == TextFormat.bold
                            ? FontWeight.bold
                            : FontWeight.normal,
                        decoration: currentTextFormat == TextFormat.underscore
                            ? TextDecoration.underline
                            : TextDecoration.none),
                    decoration: const InputDecoration(
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    onChanged: (text) {
                      setState(() {
                        textLength =
                            frontTextEditingController.text.length.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$textLength/400'),
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
      ),
    );
  }
}

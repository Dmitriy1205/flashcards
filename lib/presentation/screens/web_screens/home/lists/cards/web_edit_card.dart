import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/view_flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/router/router.dart';

class WebEditCard extends StatefulWidget {
  const WebEditCard({Key? key, this.cardEntity, required this.collectionId})
      : super(key: key);
  final CardEntity? cardEntity;
  final String collectionId;

  @override
  State<WebEditCard> createState() => _WebEditCardState();
}

class _WebEditCardState extends State<WebEditCard> {
  final TextEditingController frontTextEditingController =
      TextEditingController();

  final TextEditingController backTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.cardEntity != null) {
      frontTextEditingController.text = widget.cardEntity!.front;
      backTextEditingController.text = widget.cardEntity!.back;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              GestureDetector(
                onTap: () {
                  router.pop();
                },
                child: const FaIcon(FontAwesomeIcons.chevronLeft),
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                widget.cardEntity == null
                    ? '${AppStrings.create} ${AppStrings.card.toLowerCase()}'
                    : '${AppStrings.edit} ${AppStrings.card.toLowerCase()}',
                style: AppTheme.themeData.textTheme.titleLarge,
              ),
            ]),
            TextButton(
              onPressed: () {
                if (frontTextEditingController.text.isNotEmpty &&
                    backTextEditingController.text.isNotEmpty) {
                  if (widget.cardEntity == null) {
                    CreateCardParam card = CreateCardParam(
                        front: frontTextEditingController.text,
                        back: backTextEditingController.text,
                        collectionId: widget.collectionId);
                    Navigator.pop(context);
                    context.read<CardsBloc>().add(CardsEvent.createNewCard(
                        cardParam: card, collectionId: widget.collectionId));
                  } else {
                    EditCardParam card = EditCardParam(
                        front: frontTextEditingController.text,
                        back: backTextEditingController.text,
                        collectionId: widget.collectionId,
                        id: widget.cardEntity!.id);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewFlashCard(
                                  card: widget.cardEntity!,
                                  collectionId: widget.collectionId,
                                )));
                    context.read<CardsBloc>().add(CardsEvent.editCard(
                        cardParam: card, collectionId: widget.collectionId));
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
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 12, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.front,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    Container(
                      color: Colors.white,
                      width: 382,
                      height: 163,
                      child: TextField(controller: frontTextEditingController),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 12, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.back,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                    Container(
                      color: Colors.white,
                      width: 382,
                      height: 163,
                      child: TextField(controller: backTextEditingController),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/image.svg',
                    height: 76,
                    width: 76,
                  ),
                  const SizedBox(width: 70),
                  SvgPicture.asset(
                    'assets/icons/edit_2.svg',
                    height: 76,
                    width: 76,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

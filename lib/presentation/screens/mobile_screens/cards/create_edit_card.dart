import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/cards/view_flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CreateEditCard extends StatefulWidget {
  CreateEditCard({Key? key, this.card}) : super(key: key);
  CardEntity? card;

  @override
  State<CreateEditCard> createState() => _CreateEditCardState();
}

class _CreateEditCardState extends State<CreateEditCard> {
  final TextEditingController frontTextEditingController =
      TextEditingController();

  final TextEditingController backTextEditingController =
      TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  AppIcons.leftArrow,
                  height: 21,
                  width: 19,
                ),
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                widget.card == null
                    ? '${AppStrings.create} ${AppStrings.card.toLowerCase()}'
                    : '${AppStrings.edit} ${AppStrings.card.toLowerCase()}',
                style: AppTheme.themeData.textTheme.titleLarge,
              ),
            ]),
            TextButton(
              onPressed: () {
                if (frontTextEditingController.text.isNotEmpty &&
                    backTextEditingController.text.isNotEmpty) {
                  if (widget.card == null) {
                    Navigator.pop(context);
                    context.read<CardsBloc>().add(CardsEvent.createNewCard(
                        front: frontTextEditingController.text,
                        back: backTextEditingController.text));
                  } else {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewFlashCard(
                                  card: CardEntity(
                                      id: widget.card!.id,
                                      front: frontTextEditingController.text,
                                      back: backTextEditingController.text),
                                )));
                    context.read<CardsBloc>().add(CardsEvent.editCard(
                        card: CardEntity(
                            id: widget.card!.id,
                            front: frontTextEditingController.text,
                            back: backTextEditingController.text)));
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
                    AppIcons.addImage,
                    height: 76,
                    width: 76,
                  ),
                  const SizedBox(width: 70),
                  SvgPicture.asset(
                    AppIcons.edit2,
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

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
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

class CreateEditCard extends StatefulWidget {
  const CreateEditCard({Key? key, this.cardEntity, required this.collectionId})
      : super(key: key);
  final CardEntity? cardEntity;
  final String collectionId;

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
    if (widget.cardEntity != null) {
      frontTextEditingController.text = widget.cardEntity!.front;
      backTextEditingController.text = widget.cardEntity!.back;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                    context
                        .read<ListsBloc>()
                        .add(const ListsEvent.started(isEditMode: false));
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
                                  card: widget.cardEntity!.copyWith(
                                    front: frontTextEditingController.text,
                                    back: backTextEditingController.text,
                                  ),
                                  collectionId: widget.collectionId,
                                )));

                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ViewFlashCard(
                    //               card: widget.cardEntity!,
                    //               collectionId: widget.collectionId,
                    //             )));
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 12, top: 12, left: 24, right: 24),
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
                  CustomTextInput(
                      textEditingController: frontTextEditingController)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 12, top: 12, left: 24, right: 24),
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
                  CustomTextInput(
                      textEditingController: backTextEditingController)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/cards/view_flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/router/router.dart';

class WebCreateCard extends StatefulWidget {
  WebCreateCard({Key? key, this.card}) : super(key: key);
  CardEntity? card;

  @override
  State<WebCreateCard> createState() => _WebCreateCardState();
}

class _WebCreateCardState extends State<WebCreateCard> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 64,),
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
            // TextButton(
            //   onPressed: () {
            //     if (frontTextEditingController.text.isNotEmpty &&
            //         backTextEditingController.text.isNotEmpty) {
            //       if (widget.card == null) {
            //         Navigator.pop(context);
            //         context.read<CardsBloc>().add(CardsEvent.createNewCard(
            //             front: frontTextEditingController.text,
            //             back: backTextEditingController.text));
            //       } else {
            //         Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => ViewFlashCard(
            //                   card: CardEntity(
            //                       id: widget.card!.id,
            //                       front: frontTextEditingController.text,
            //                       back: backTextEditingController.text),
            //                 )));
            //         context.read<CardsBloc>().add(CardsEvent.editCard(
            //             card: CardEntity(
            //                 id: widget.card!.id,
            //                 front: frontTextEditingController.text,
            //                 back: backTextEditingController.text)));
            //       }
            //     }
            //   },
            //   child: Text(
            //     AppStrings.done,
            //     style: AppTheme.themeData.textTheme.titleLarge!.copyWith(
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      body: ColoredBox(
        color: AppColors.background,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 914,
              height: MediaQuery.of(context).size.height/1.23,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),

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
        ),
      ),
    );
  }
}
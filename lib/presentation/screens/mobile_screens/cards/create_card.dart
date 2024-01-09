import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CreateCard extends StatelessWidget {
  CreateCard({Key? key}) : super(key: key);
  final TextEditingController frontTextEditingController =
      TextEditingController();
  final TextEditingController backTextEditingController =
      TextEditingController();

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
                  'assets/icons/left_arrow.svg',
                  height: 21,
                  width: 19,
                ),
              ),
              const SizedBox(
                width: 19,
              ),
              Text(
                AppStrings.cards,
                style: AppTheme.themeData.textTheme.titleLarge,
              ),
            ]),
            TextButton(
              onPressed: () {
                if (frontTextEditingController.text.isNotEmpty &&
                    backTextEditingController.text.isNotEmpty) {
                  context.read<CardsBloc>().add(CardsEvent.createNewCard(
                      front: frontTextEditingController.text,
                      back: backTextEditingController.text));
                  Navigator.pop(context);
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

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/screens/cards/create_card.dart';
import 'package:flashcards/presentation/screens/cards/view_flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key, required this.collectionName}) : super(key: key);
  final String collectionName;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
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
                context.read<CardsBloc>().isEditMode
                    ? TextButton(
                        onPressed: () {
                          context.read<CardsBloc>().isEditMode = false;
                          setState(() {});
                        },
                        child: Text(
                          AppStrings.cancel,
                          style:
                              AppTheme.themeData.textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : Row(children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icons/share.svg',
                            height: 21,
                            width: 19,
                          ),
                        ),
                        const SizedBox(
                          width: 29,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CardsBloc>().isEditMode =
                                !context.read<CardsBloc>().isEditMode;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            'assets/icons/edit.svg',
                            height: 23,
                            width: 23,
                          ),
                        ),
                      ])
              ],
            ),
          ],
        ),
      ),
      body: BlocConsumer<CardsBloc, CardsState>(
        listener: (context, state) async {
          state.maybeMap(orElse: () {});
        },
        builder: (context, state) {
          return state.maybeMap(initial: (_) {
            return Column(
              children: [
                Container(
                  color: AppColors.background,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 26.0, right: 24, top: 20, bottom: 9),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.collectionName,
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          Text(
                            '${context.read<CardsBloc>().cardsList.length} cards',
                            style: AppTheme.themeData.textTheme.labelSmall!
                                .copyWith(
                              color: AppColors.mainAccent,
                            ),
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.background,
                    child: ListView.builder(
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 11, top: 11),
                            child: Row(
                              children: [
                                context.read<CardsBloc>().isEditMode
                                    ? Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            context
                                                    .read<CardsBloc>()
                                                    .cardsList[i]['toDelete'] =
                                                !context
                                                    .read<CardsBloc>()
                                                    .cardsList[i]['toDelete'];
                                            setState(() {
                                              print('setstate');
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: context
                                                      .watch<CardsBloc>()
                                                      .cardsList[i]['toDelete']
                                                  ? const Icon(
                                                      Icons.check_circle,
                                                      size: 23.0,
                                                      color:
                                                          AppColors.mainAccent,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .radio_button_unchecked,
                                                      size: 23.0,
                                                      color:
                                                          AppColors.mainAccent,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                  width: context.read<CardsBloc>().isEditMode
                                      ? 18
                                      : 0,
                                ),
                                Flexible(
                                  flex: 8,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewFlashCard(
                                                      card: CardEntity(
                                                          front: 'Front',
                                                          back: 'BACK'),
                                                    )));
                                      },
                                      child: ListTile(
                                        title: Text(
                                          context.read<CardsBloc>().cardsList[i]
                                              ['name'],
                                          style: AppTheme
                                              .themeData.textTheme.titleMedium!
                                              .copyWith(fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          'back',
                                          style: AppTheme
                                              .themeData.textTheme.labelSmall!
                                              .copyWith(
                                            color: AppColors.mainAccent,
                                          ),
                                        ),
                                        trailing: SvgPicture.asset(
                                          'assets/icons/right_arrow.svg',
                                          height: 18,
                                          width: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: context.read<CardsBloc>().cardsList.length),
                  ),
                ),
              ],
            );
          }, orElse: () {
            return const Center(child: Text('No cards found'));
          });
        },
      ),
      floatingActionButton: context.watch<CardsBloc>().isEditMode
          ? GestureDetector(
              onTap: () {
                context
                    .read<CardsBloc>()
                    .add(const CardsEvent.deleteSelectedCards());
                context.read<CardsBloc>().isEditMode = false;
              },
              child: SizedBox(
                height: 76,
                width: 76,
                child: SvgPicture.asset(
                  'assets/icons/red_bucket.svg',
                  height: 18,
                  width: 9,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateCard()));
              },
              child: SizedBox(
                height: 76,
                width: 76,
                child: SvgPicture.asset(
                  'assets/icons/add_card.svg',
                  height: 18,
                  width: 9,
                ),
              ),
            ),
    );
  }
}

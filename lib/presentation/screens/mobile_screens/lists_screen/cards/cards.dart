import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/view_flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'create_edit_card.dart';

class Cards extends StatefulWidget {
  const Cards(
      {Key? key, required this.collectionId, required this.collectionName})
      : super(key: key);
  final String collectionId;
  final String collectionName;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<CardsBloc>()
        .add(CardsEvent.initCard(collectionId: widget.collectionId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () {
                    context
                        .read<ListsBloc>()
                        .add(const ListsEvent.started(isEditMode: false));
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
                  AppStrings.cards,
                  style: AppTheme.themeData.textTheme.headlineLarge,
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
                  : Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent, // <- Here
                        highlightColor: Colors.transparent, // <- Here
                        hoverColor: Colors.transparent, // <- Here
                      ),
                      child: DropdownButton<String>(
                        isDense: true,
                        padding: const EdgeInsets.only(
                          right: 23,
                        ),
                        underline: const Text(''),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(7)),
                        icon: SvgPicture.asset(
                          AppIcons.menuIcon,
                          height: 23,
                          width: 23,
                        ),
                        items: [
                          DropdownMenuItem<String>(
                            value: 'false',
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.shareBlack,
                                  height: 23,
                                  width: 23,
                                ),
                                const SizedBox(width: 23),
                                Text(
                                  AppStrings.share,
                                  style:
                                      AppTheme.themeData.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'false',
                            onTap: () {
                              context.read<CardsBloc>().isEditMode = true;
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.editBlack,
                                  height: 23,
                                  width: 23,
                                ),
                                const SizedBox(width: 23),
                                Text(
                                  AppStrings.edit,
                                  style:
                                      AppTheme.themeData.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'false',
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.fileImport,
                                  height: 23,
                                  width: 23,
                                ),
                                const SizedBox(width: 23),
                                Text(
                                  'File Import',
                                  style:
                                      AppTheme.themeData.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'false',
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.filePdf,
                                  height: 23,
                                  width: 23,
                                ),
                                const SizedBox(width: 23),
                                Text(
                                  AppStrings.filePdf,
                                  style:
                                      AppTheme.themeData.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'false',
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.learnNow,
                                  height: 23,
                                  width: 23,
                                ),
                                const SizedBox(width: 23),
                                Text(
                                  AppStrings.learnNow,
                                  style:
                                      AppTheme.themeData.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (_) {},
                      ),
                    )
            ],
          ),
        ]),
      ),
      body: BlocConsumer<CardsBloc, CardsState>(
        listener: (context, state) async {
          state.maybeMap(orElse: () {});
        },
        builder: (context, state) {
          print('stateCard $state');
          return state.maybeMap(initial: (data) {
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
                            '${data.cardsList!.length} cards',
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
                          CardEntity card = data.cardsList![i];
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
                                            setState(() {
                                              /// TODO ======
                                              if (context
                                                  .read<CardsBloc>()
                                                  .cardsListToDelete
                                                  .contains(
                                                      data.cardsList![i].id)) {
                                                context
                                                    .read<CardsBloc>()
                                                    .cardsListToDelete
                                                    .remove(
                                                        data.cardsList![i].id);
                                              } else {
                                                context
                                                    .read<CardsBloc>()
                                                    .cardsListToDelete
                                                    .add(data.cardsList![i].id);
                                              }
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
                                                      .cardsListToDelete
                                                      .contains(
                                                          data.cardsList![i].id)
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
                                                      card: card,
                                                      collectionId:
                                                          widget.collectionId,
                                                    )));
                                      },
                                      child: ListTile(
                                        title: Text(
                                          card.front,
                                          style: AppTheme
                                              .themeData.textTheme.titleMedium!
                                              .copyWith(fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          card.back,
                                          style: AppTheme
                                              .themeData.textTheme.labelSmall!
                                              .copyWith(
                                            color: AppColors.mainAccent,
                                          ),
                                        ),
                                        trailing: SvgPicture.asset(
                                          AppIcons.rightArrow,
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
                        itemCount: data.cardsList!.length),
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
          ? Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: GestureDetector(
                onTap: () {
                  context.read<CardsBloc>().add(CardsEvent.deleteSelectedCards(
                      cardsIdToDelete:
                          context.read<CardsBloc>().cardsListToDelete,
                      collectionId: widget.collectionId));
                  context.read<CardsBloc>().isEditMode = false;
                },
                child: SizedBox(
                  height: 76,
                  width: 76,
                  child: SvgPicture.asset(
                    AppIcons.redBucket,
                    height: 18,
                    width: 9,
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateEditCard(
                              collectionId: widget.collectionId)));
                },
                child: SizedBox(
                  height: 76,
                  width: 76,
                  child: SvgPicture.asset(
                    AppIcons.addCard,
                    height: 18,
                    width: 9,
                  ),
                ),
              ),
            ),
    );
  }
}

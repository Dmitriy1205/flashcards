import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/web_screens/home/lists/cards/web_view_flash_card.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/const/icons.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../widgets/app_round_button.dart';

class WebCards extends StatefulWidget {
  const WebCards(
      {Key? key, required this.collectionId, required this.collectionName})
      : super(key: key);
  final String collectionName;
  final String collectionId;

  @override
  State<WebCards> createState() => _WebCardsState();
}

class _WebCardsState extends State<WebCards> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  void initState() {
    context
        .read<CardsBloc>()
        .add(CardsEvent.initCard(collectionId: widget.collectionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 700) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 26,
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<ListsBloc>()
                              .add(const ListsEvent.started(isEditMode: false));
                          Navigator.of(context).pop();
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.chevronLeft,
                        ),
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      Text(
                        AppStrings.cards,
                        style: AppTheme.themeData.textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                    ),
                    child: DropdownButton<String>(
                      isDense: true,
                      padding: const EdgeInsets.only(
                        right: 23,
                      ),
                      underline: const Text(''),
                      borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(7)),
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
                                'assets/icons/share_black.svg',
                                height: 23,
                                width: 23,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                'Share',
                                style: AppTheme.themeData.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'false',
                          onTap: () {
                            context.read<CardsBloc>().isEditMode =
                            !context.read<CardsBloc>().isEditMode;
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/edit_black.svg',
                                height: 23,
                                width: 23,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                'Edit',
                                style: AppTheme.themeData.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'false',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/file_import.svg',
                                height: 23,
                                width: 23,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                'File Import',
                                style: AppTheme.themeData.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'false',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/file_pdf.svg',
                                height: 23,
                                width: 23,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                'File Pdf',
                                style: AppTheme.themeData.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'false',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/learn_now.svg',
                                height: 23,
                                width: 23,
                              ),
                              SizedBox(width: 23),
                              Text(
                                'Learn Now',
                                style: AppTheme.themeData.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (_) {},
                    ),
                  )
                  // DropdownMenu(
                  //         trailingIcon: SvgPicture.asset(
                  //           'assets/icons/edit_icon.svg',
                  //           height: 23,
                  //           width: 23,
                  //         ),
                  //         dropdownMenuEntries: [
                  //           DropdownMenuEntry(label: 'sa', value: false)
                  //         ],
                  //       ),
                ],
              ),
            ]),
          ),
          body: BlocConsumer<CardsBloc, CardsState>(
            listener: (context, state) async {
              state.maybeMap(orElse: () {});
            },
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const LoadingIndicator(),
                  error: (_)=> const Center(child: Text('No cards here yet'),),
                  orElse: () {
                    return Container(
                      color: AppColors.background,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.collectionName,
                                    style: AppTheme.themeData.textTheme.titleLarge!
                                        .copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    '${state.cardsList!.length} cards',
                                    style: AppTheme.themeData.textTheme.labelSmall!
                                        .copyWith(
                                      color: AppColors.mainAccent,
                                    ),
                                  )
                                ]),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 19.0,
                                  left: context.read<CardsBloc>().isEditMode
                                      ? 25
                                      : 25,
                                  bottom: 100,
                                  right: context.read<CardsBloc>().isEditMode
                                      ? 25
                                      : 25),
                              child: ListView.builder(
                                itemCount: state.cardsList!.length,
                                itemBuilder: (context, i) {
                                  CardEntity card = state.cardsList![i];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 23.0),
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        children: [
                                          context.read<CardsBloc>().isEditMode
                                              ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (context
                                                    .read<CardsBloc>()
                                                    .cardsListToDelete
                                                    .contains(context
                                                    .read<CardsBloc>()
                                                    .state
                                                    .cardsList![i]
                                                    .id)) {
                                                  context
                                                      .read<CardsBloc>()
                                                      .cardsListToDelete
                                                      .remove(context
                                                      .read<CardsBloc>()
                                                      .state
                                                      .cardsList![i]
                                                      .id);
                                                } else {
                                                  context.read<CardsBloc>().cardsListToDelete.add(
                                                      context
                                                          .read<CardsBloc>()
                                                          .state
                                                          .cardsList![i]
                                                          .id);
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
                                                    .contains(state
                                                    .cardsList![i].id)
                                                    ? const Icon(
                                                  Icons.check_circle,
                                                  size: 23.0,
                                                  color: AppColors
                                                      .mainAccent,
                                                )
                                                    : const Icon(
                                                  Icons
                                                      .radio_button_unchecked,
                                                  size: 23.0,
                                                  color: AppColors
                                                      .mainAccent,
                                                ),
                                              ),
                                            ),
                                          )
                                              : const SizedBox(),
                                          SizedBox(
                                            width:
                                            context.read<CardsBloc>().isEditMode
                                                ? 18
                                                : 0,
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            WebViewFlashCard(
                                                                card: card,
                                                                collectionId: widget
                                                                    .collectionId)));
                                              },
                                              child: Container(
                                                height: 76,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 24.0, vertical: 15),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        card.front,
                                                        style: AppTheme.themeData
                                                            .textTheme.titleSmall!
                                                            .copyWith(
                                                            color: AppColors
                                                                .mainAccent),
                                                      ),
                                                      Text(
                                                        card.back,
                                                        style: AppTheme.themeData
                                                            .textTheme.labelSmall!
                                                            .copyWith(
                                                          color: Colors.black,
                                                        ),
                                                      ),
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
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          floatingActionButton: context.watch<CardsBloc>().isEditMode
              ? Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppRoundButton(
                  onTap: () {
                    context.read<CardsBloc>().add(
                        CardsEvent.deleteSelectedCards(
                            cardsIdToDelete:
                            context.read<CardsBloc>().cardsListToDelete,
                            collectionId: widget.collectionId));
                  },
                  svgIcon: AppIcons.trash,
                  showBorder: false,
                  color: AppColors.red,
                ),
                const SizedBox(
                  width: 19,
                ),
                AppRoundButton(
                  onTap: () {
                    setState(() {
                      context.read<CardsBloc>().isEditMode = false;
                    });

                  },
                  svgIcon: AppIcons.close,
                  showBorder: false,
                  color: AppColors.greyLight,
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 18),
            child: AppRoundButton(
              onTap: () {
                router.push('/create_card',extra: {"collectionId":widget.collectionId});
              },
              svgIcon: AppIcons.plus,
              showBorder: false,
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 64,
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<ListsBloc>()
                            .add(ListsEvent.started(isEditMode: false));
                        Navigator.of(context).pop();
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.chevronLeft,
                      ),
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      AppStrings.cards,
                      style: AppTheme.themeData.textTheme.headlineLarge,
                    ),
                  ],
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                  ),
                  child: DropdownButton<String>(
                    isDense: true,
                    padding: const EdgeInsets.only(
                      right: 23,
                    ),
                    underline: const Text(''),
                    borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(7)),
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
                              'assets/icons/share_black.svg',
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(width: 23),
                            Text(
                              'Share',
                              style: AppTheme.themeData.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'false',
                        onTap: () {
                          context.read<CardsBloc>().isEditMode =
                          !context.read<CardsBloc>().isEditMode;
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/edit_black.svg',
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(width: 23),
                            Text(
                              'Edit',
                              style: AppTheme.themeData.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'false',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/file_import.svg',
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(width: 23),
                            Text(
                              'File Import',
                              style: AppTheme.themeData.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'false',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/file_pdf.svg',
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(width: 23),
                            Text(
                              'File Pdf',
                              style: AppTheme.themeData.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'false',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/learn_now.svg',
                              height: 23,
                              width: 23,
                            ),
                            SizedBox(width: 23),
                            Text(
                              'Learn Now',
                              style: AppTheme.themeData.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                )
                // DropdownMenu(
                //         trailingIcon: SvgPicture.asset(
                //           'assets/icons/edit_icon.svg',
                //           height: 23,
                //           width: 23,
                //         ),
                //         dropdownMenuEntries: [
                //           DropdownMenuEntry(label: 'sa', value: false)
                //         ],
                //       ),
              ],
            ),
          ]),
        ),
        body: BlocConsumer<CardsBloc, CardsState>(
          listener: (context, state) async {
            state.maybeMap(orElse: () {});
          },
          builder: (context, state) {
            return state.maybeMap(
                loading: (_) => const LoadingIndicator(),
                error: (_)=> const Center(child: Text('No cards here yet'),),
                orElse: () {
                  return Container(
                    color: AppColors.background,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 87,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.collectionName,
                                  style: AppTheme.themeData.textTheme.titleLarge!
                                      .copyWith(fontSize: 18),
                                ),
                                Text(
                                  '${state.cardsList!.length} cards',
                                  style: AppTheme.themeData.textTheme.labelSmall!
                                      .copyWith(
                                    color: AppColors.mainAccent,
                                  ),
                                )
                              ]),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 26.0,
                                left: context.read<CardsBloc>().isEditMode
                                    ? 25
                                    : 87,
                                bottom: 100,
                                right: context.read<CardsBloc>().isEditMode
                                    ? 120
                                    : 141),
                            child: GridView.builder(
                              gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 440.0,
                                  // Maximum width of each item
                                  crossAxisSpacing:
                                  context.read<CardsBloc>().isEditMode
                                      ? 18
                                      : 36.0,
                                  // Horizontal spacing between items
                                  mainAxisSpacing: 30.0,
                                  mainAxisExtent: 140),
                              itemCount: state.cardsList!.length,
                              itemBuilder: (context, i) {
                                CardEntity card = state.cardsList![i];
                                return Container(
                                  padding: EdgeInsets.zero,
                                  child: Row(
                                    children: [
                                      context.read<CardsBloc>().isEditMode
                                          ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (context
                                                .read<CardsBloc>()
                                                .cardsListToDelete
                                                .contains(context
                                                .read<CardsBloc>()
                                                .state
                                                .cardsList![i]
                                                .id)) {
                                              context
                                                  .read<CardsBloc>()
                                                  .cardsListToDelete
                                                  .remove(context
                                                  .read<CardsBloc>()
                                                  .state
                                                  .cardsList![i]
                                                  .id);
                                            } else {
                                              context.read<CardsBloc>().cardsListToDelete.add(
                                                  context
                                                      .read<CardsBloc>()
                                                      .state
                                                      .cardsList![i]
                                                      .id);
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
                                                .contains(state
                                                .cardsList![i].id)
                                                ? const Icon(
                                              Icons.check_circle,
                                              size: 23.0,
                                              color: AppColors
                                                  .mainAccent,
                                            )
                                                : const Icon(
                                              Icons
                                                  .radio_button_unchecked,
                                              size: 23.0,
                                              color: AppColors
                                                  .mainAccent,
                                            ),
                                          ),
                                        ),
                                      )
                                          : const SizedBox(),
                                      SizedBox(
                                        width:
                                        context.read<CardsBloc>().isEditMode
                                            ? 18
                                            : 0,
                                      ),
                                      Flexible(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebViewFlashCard(
                                                            card: card,
                                                            collectionId: widget
                                                                .collectionId)));
                                          },
                                          child: Container(
                                            height: 148,
                                            width: 380,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 24.0, vertical: 19),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    card.front,
                                                    style: AppTheme.themeData
                                                        .textTheme.titleSmall!
                                                        .copyWith(
                                                        color: AppColors
                                                            .mainAccent),
                                                  ),
                                                  Text(
                                                    card.back,
                                                    style: AppTheme.themeData
                                                        .textTheme.labelSmall!
                                                        .copyWith(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
        floatingActionButton: context.watch<CardsBloc>().isEditMode
            ? Padding(
          padding: const EdgeInsets.only(right: 80.0, bottom: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppRoundButton(
                onTap: () {
                  context.read<CardsBloc>().add(
                      CardsEvent.deleteSelectedCards(
                          cardsIdToDelete:
                          context.read<CardsBloc>().cardsListToDelete,
                          collectionId: widget.collectionId));
                },
                svgIcon: AppIcons.trash,
                showBorder: false,
                color: AppColors.red,
              ),
              const SizedBox(
                width: 19,
              ),
              AppRoundButton(
                onTap: () {
                  setState(() {
                    context.read<CardsBloc>().isEditMode = false;
                  });

                },
                svgIcon: AppIcons.close,
                showBorder: false,
                color: AppColors.greyLight,
              ),
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.only(right: 80.0, bottom: 30),
          child: AppRoundButton(
            onTap: () {
              router.push('/create_card',extra: {"collectionId":widget.collectionId});
            },
            svgIcon: AppIcons.plus,
            showBorder: false,
          ),
        ),
      );
    },

    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/core/utils/confirm_dialog.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/cards/collection_pick.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards/presentation/widgets/quill_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../widgets/learn_dialog.dart';
import 'create_edit_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key,
    required this.collectionId,
    required this.collectionName,
    this.sender})
      : super(key: key);
  final String collectionId;
  final String collectionName;
  final String? sender;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.sender != null) {
      context.read<CardsBloc>().add(CardsEvent.createSharedCards(
          collectionId: widget.collectionId, sender: widget.sender!));
    }
    context
        .read<CardsBloc>()
        .isEditMode = false;
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
              GestureDetector(
                onTap: () {
                  context
                      .read<ListsBloc>()
                      .add(const ListsEvent.started(isEditMode: false));
                  context
                      .read<CardsBloc>()
                      .add(const CardsEvent.emptyCardsList());
                  router.go('/mobile_home');
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(children: [
                    SvgPicture.asset(
                      AppIcons.leftArrow,
                      color: Colors.black,
                      height: 21,
                      width: 19,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      AppLocalizations.of(context)!.cards,
                      style: AppTheme.themeData.textTheme.headlineLarge,
                    ),
                  ]),
                ),
              ),
              context
                  .read<CardsBloc>()
                  .isEditMode
                  ? TextButton(
                onPressed: () {
                  context
                      .read<CardsBloc>()
                      .isEditMode = false;
                  setState(() {});
                },
                child: Text(
                  AppLocalizations.of(context)!.cancel,
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
                      child: InkWell(
                        onTap: () {
                          context.read<CardsBloc>().add(
                              CardsEvent.shareCollection(
                                  collectionId: widget.collectionId,
                                  collectionName: widget.collectionName));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.shareBlack,
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(width: 23),
                            Text(
                              AppLocalizations.of(context)!.share,
                              style: AppTheme
                                  .themeData.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'false',
                      onTap: () {
                        context
                            .read<CardsBloc>()
                            .isEditMode = true;
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
                            AppLocalizations.of(context)!.edit,
                            style:
                            AppTheme.themeData.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      onTap: () async {
                        final file = await FilePicker.platform.pickFiles(
                            allowedExtensions: ["xlsx", "csv"],
                            type: FileType.custom);
                        if (!mounted) return;
                        if (file == null) return;
                        context.read<CardsBloc>().add(
                            CardsEvent.importExcel(
                                path: file.paths.first!,
                                collectionId: widget.collectionId,
                                collectionName: widget.collectionName));
                      },
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
                      onTap: () {
                        context.push("/attach_pdf", extra: {
                          "collectionId": widget.collectionId,
                          "collectionName": widget.collectionName
                        });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.filePdf,
                            height: 23,
                            width: 23,
                          ),
                          const SizedBox(width: 23),
                          Text(
                            AppLocalizations.of(context)!.filePdf,
                            style:
                            AppTheme.themeData.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'false',
                      onTap: () {
                        showBottomMenu(
                            context: context,
                            selectedCollectionId: widget.collectionId);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.learnNow,
                            color: Colors.black,
                            height: 23,
                            width: 23,
                          ),
                          const SizedBox(width: 23),
                          Text(
                            AppLocalizations.of(context)!.learnNow,
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
      body: Stack(
        children: [
          BlocConsumer<CardsBloc, CardsState>(
            listener: (context, state) async {
              state.maybeMap(
                  successfullyImported: (_) {
                    AppToast.showSuccess(context,
                        AppLocalizations.of(context)!.successfullyImported);
                  },
                  orElse: () {});
            },
            builder: (context, state) {
              return state.maybeMap(loading: (_) {
                return Container(
                    color: AppColors.background,
                    child: const LoadingIndicator());
              }, loaded: (data) {
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
                                    .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${data.cardsList!.length} ${AppLocalizations
                                    .of(context)!.cards.toLowerCase()}',
                                style: AppTheme.themeData.textTheme.labelSmall!
                                    .copyWith(
                                  color: Colors.black,
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
                                    context
                                        .read<CardsBloc>()
                                        .isEditMode
                                        ? Flexible(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (context
                                                .read<CardsBloc>()
                                                .cardsListToDelete
                                                .contains(data
                                                .cardsList![i].id)) {
                                              context
                                                  .read<CardsBloc>()
                                                  .cardsListToDelete
                                                  .remove(data
                                                  .cardsList![i].id);
                                            } else {
                                              context
                                                  .read<CardsBloc>()
                                                  .cardsListToDelete
                                                  .add(data
                                                  .cardsList![i].id);
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                10.0),
                                            child: context
                                                .watch<CardsBloc>()
                                                .cardsListToDelete
                                                .contains(data
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
                                      ),
                                    )
                                        : const SizedBox(),
                                    SizedBox(
                                      width:
                                      context
                                          .read<CardsBloc>()
                                          .isEditMode
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
                                            router.push(
                                              '/view_card_mobile',
                                              extra: {
                                                "card": card,
                                                "collectionId":
                                                widget.collectionId,
                                              },
                                            );
                                          },
                                          child: ListTile(
                                            title: QuillText(
                                              content: card.front,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.mainAccent),
                                            ),
                                            subtitle: QuillText(
                                              content: card.back,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
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
              }, error: (e) {
                return Center(
                    child: Text(
                      'Error $e',
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(fontSize: 18),
                    ));
              }, orElse: () {
                return Container(
                    color: AppColors.background,
                    child: const LoadingIndicator());
              });
            },
          ),
          _FloatingActionButtons(
            collectionId: widget.collectionId,
            active: context
                .watch<CardsBloc>()
                .cardsListToDelete
                .isNotEmpty,
            onAddTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateEditCard(collectionId: widget.collectionId)));
            },
            onCopyTap: () async {
              context
                  .read<CardsBloc>()
                  .isEditMode = false;
              final collectionId =
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CollectionPick(
                        move: false,
                      )));
              if (collectionId == null) return;
              if(!mounted) return;
              final cards = context
                  .read<CardsBloc>()
                  .state
                  .cardsList!
                  .where((e) =>
                  context
                      .read<CardsBloc>()
                      .cardsListToDelete
                      .contains(e.id))
                  .toList();
              context.read<CardsBloc>().add(CardsEvent.copyCards(cards: cards,
                  toCollectionId: collectionId));
              context
                  .read<CardsBloc>()
                  .cardsListToDelete.clear();
            },
            onDeleteTap: () async {
              final confirmed = await confirmOperation(context,
                  title: AppLocalizations.of(context)!.confirmDeleting,
                  message: AppLocalizations.of(context)!.deleteSelectedCards,
                  action: AppLocalizations.of(context)!.delete,
                  cancel: AppLocalizations.of(context)!.cancel);
              if (!confirmed) return;
              context.read<CardsBloc>().add(CardsEvent.deleteSelectedCards(
                  cardsIdToDelete: context
                      .read<CardsBloc>()
                      .cardsListToDelete,
                  collectionId: widget.collectionId));
              context
                  .read<CardsBloc>()
                  .isEditMode = false;
            },
            onMoveTap: () async {
              context
                  .read<CardsBloc>()
                  .isEditMode = false;
              final collectionId =
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CollectionPick(
                        move: true,
                      )));
              if (collectionId == null) return;
              if(!mounted) return;
              final cards = context
                  .read<CardsBloc>()
                  .state
                  .cardsList!
                  .where((e) =>
                  context
                      .read<CardsBloc>()
                      .cardsListToDelete
                      .contains(e.id))
                  .toList();
              context.read<CardsBloc>().add(CardsEvent.moveCards(cards: cards,
                  fromCollectionId: widget.collectionId,
                  toCollectionId: collectionId));
              context
                  .read<CardsBloc>()
                  .cardsListToDelete.clear();
            },
          ),
        ],
      ),
    );
  }
}

class _FloatingActionButtons extends StatelessWidget {
  final String collectionId;
  final bool active;
  final VoidCallback onAddTap;
  final VoidCallback onDeleteTap;
  final VoidCallback onMoveTap;
  final VoidCallback onCopyTap;

  const _FloatingActionButtons({Key? key,
    required this.active,
    required this.collectionId,
    required this.onAddTap,
    required this.onDeleteTap,
    required this.onMoveTap,
    required this.onCopyTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 28,
      child: context
          .watch<CardsBloc>()
          .isEditMode
          ? Column(
        children: [
          _button(
              assetPath: AppIcons.copy, onTap: onCopyTap, active: active),
          const SizedBox(
            height: 15,
          ),
          _button(
              assetPath: AppIcons.move, onTap: onMoveTap, active: active),
          const SizedBox(
            height: 15,
          ),
          _button(
              assetPath: AppIcons.redBucket,
              onTap: onDeleteTap,
              active: active),
        ],
      )
          : _button(assetPath: AppIcons.addCard, onTap: onAddTap),
    );
  }

  Widget _button({required String assetPath,
    required VoidCallback onTap,
    bool active = true}) {
    return Opacity(
      opacity: active ? 1 : 0.5,
      child: SizedBox(
        width: 76,
        height: 76,
        child: Stack(
          children: [
            SizedBox(
              height: 76,
              width: 76,
              child: SvgPicture.asset(
                assetPath,
                height: 18,
                width: 9,
              ),
            ),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                  borderRadius: BorderRadius.circular(32),
                  onTap: !active ? () {} : onTap,
                  child: Container(
                      width: 76, height: 76, color: Colors.transparent)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/widgets/create_edit_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/confirm_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int pageIndex = 0;
  TextEditingController nameTextEditingController = TextEditingController();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Stack(
        children: [
          Positioned(
            left: 24,
            bottom: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 56,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 34, right: 22),
                      child: SvgPicture.asset(
                        pageIndex == 0
                            ? AppIcons.selectedHamburger
                            : AppIcons.defaultHamburger,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, right: 22),
                      child: SvgPicture.asset(
                        pageIndex == 1 ? AppIcons.selectedHat : AppIcons.hat,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, right: 33),
                      child: SvgPicture.asset(
                        pageIndex == 2
                            ? AppIcons.selectedProfile
                            : AppIcons.defaultProfile,
                        height: 20,
                      ),
                    ),
                  ]
                      .asMap()
                      .entries
                      .map((e) =>
                      SizedBox(
                        height: double.infinity,
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                pageIndex = e.key;
                                widget.pageController.animateToPage(e.key,
                                    duration:
                                    const Duration(milliseconds: 100),
                                    curve: Curves.ease);
                              });
                            },
                            child: e.value,
                          ),
                        ),
                      ))
                      .toList(),
                ),
              ),
            ),
          ),
          pageIndex != 2
              ? Positioned(
              right: 28,
              bottom: 12,
              child:
              Stack(
                children: [
                  context
                      .watch<ListsBloc>()
                      .isEditMode
                      ? SizedBox(
                    height: 64,
                    width: 64,
                    child: Opacity(
                      opacity: context.watch<ListsBloc>().listIdToDelete.isEmpty ? 0.5 : 1,
                      child: SvgPicture.asset(
                        AppIcons.redBucket,
                        height: 18,
                        width: 9,
                      ),
                    ),
                  )
                      : SizedBox(
                    height: 64,
                    width: 64,
                    child: SvgPicture.asset(
                      AppIcons.addCollection,
                      height: 18,
                      width: 9,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(32),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () async {
                          if (context
                              .read<ListsBloc>()
                              .isEditMode) {
                            if(context.read<ListsBloc>().listIdToDelete.isEmpty) return;
                            final confirmed = await confirmOperation(
                                context, title: AppLocalizations.of(context)!
                                .confirmDeleting,
                                message: AppLocalizations.of(context)!
                                    .deleteSelectedCollection,
                                action: AppLocalizations.of(context)!.delete,
                                cancel: AppLocalizations.of(context)!.cancel);
                            if (!confirmed) return;
                            context.read<ListsBloc>().add(
                                const ListsEvent.deleteSelectedCollection(
                                    collectionsList: []));
                            context
                                .read<ListsBloc>()
                                .isEditMode = false;
                          } else {
                            CreateEditCollectionDialog().dialog(context);
                          }
                        },
                        child: Container(
                            width: 64, height: 64, color: Colors.transparent)),
                  ),
                ],
              )
          )
              : const SizedBox()
        ],
      ),
    );
  }

}
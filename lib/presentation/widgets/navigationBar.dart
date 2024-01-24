import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/widgets/create_edit_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113,
      child: Stack(
        children: [
          Positioned(
            left: 24,
            bottom: 36,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 73,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 34, right: 22),
                      child: SvgPicture.asset(
                        pageIndex == 0
                            ? AppIcons.selectedHamburger
                            : AppIcons.defaultHamburger,
                        height: 27.5,
                        width: 30,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, right: 22),
                      child: SvgPicture.asset(
                        pageIndex == 1 ? AppIcons.selectedHat : AppIcons.hat,
                        height: 27.5,
                        width: 30,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 22, right: 33),
                      child: SvgPicture.asset(
                        pageIndex == 2
                            ? AppIcons.selectedProfile
                            : AppIcons.defaultProfile,
                        height: 27.5,
                        width: 30,
                      ),
                    ),
                  ]
                      .asMap()
                      .entries
                      .map((e) => SizedBox(
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
                  bottom: 10,
                  child: context.watch<ListsBloc>().isEditMode
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              context.read<ListsBloc>().add(
                                  const ListsEvent.deleteSelectedCollection(
                                      collectionsList: []));
                              context.read<ListsBloc>().isEditMode = false;
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
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: InkWell(splashColor: AppColors.greenBlack,
                            onTap: () {
                              CreateEditCollectionDialog().dialog(context);
                            },
                            child: SizedBox(
                              height: 76,
                              width: 76,
                              child: SvgPicture.asset(
                                AppIcons.addCollection,
                                height: 18,
                                width: 9,
                              ),
                            ),
                          ),
                        ),
                )
              : const SizedBox()
        ],
      ),
    );
  }}

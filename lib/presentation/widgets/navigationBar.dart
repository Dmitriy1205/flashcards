import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key? key, required this.pageController})
      : super(key: key);
  PageController pageController;

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
            child: SizedBox(
              width: 254,
              height: 73,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: BottomNavigationBar(
                  onTap: (page) {
                    setState(() {
                      pageIndex = page;
                      widget.pageController.animateToPage(page,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease);
                    });
                  },
                  currentIndex: pageIndex,
                  backgroundColor: Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        AppIcons.selectedHamburger,
                        height: 27.5,
                        width: 30,
                      ),
                      icon: SvgPicture.asset(
                        AppIcons.defaultHamburger,
                        height: 27.5,
                        width: 30,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: SvgPicture.asset(
                        pageIndex == 1 ? AppIcons.selectedHat : AppIcons.hat,
                        height: 27.5,
                        width: 30,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: SvgPicture.asset(
                        pageIndex == 2
                            ? AppIcons.selectedProfile
                            : AppIcons.defaultProfile,
                        height: 27.5,
                        width: 30,
                      ),
                    ),
                  ],
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
                          child: GestureDetector(
                            onTap: () {
                              dialog();
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
  }

  Future<void> dialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 12, right: 12, bottom: 12),
              child: SizedBox(
                height: 178,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            AppIcons.leftArrow,
                            height: 12,
                            width: 6,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.newCollection,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(AppStrings.giveName,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(color: AppColors.mainAccent)),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        style: AppTheme.themeData.textTheme.labelMedium!
                            .copyWith(
                                color: AppColors.mainAccent,
                                fontWeight: FontWeight.w700),
                        controller: nameTextEditingController,
                        decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      child: Text(AppStrings.save,
                          style: AppTheme.themeData.textTheme.labelMedium!
                              .copyWith(color: AppColors.mainAccent)),
                      onPressed: () {
                        if (nameTextEditingController.text.isNotEmpty) {
                          context.read<ListsBloc>().add(
                              ListsEvent.createNewList(
                                  name: nameTextEditingController.text));
                          nameTextEditingController.clear();
                          Navigator.of(context).pop();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

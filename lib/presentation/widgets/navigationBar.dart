import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/confirm_dialog.dart';

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
                      margin: const EdgeInsets.only(left: 34, right: 22),
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
                  child:
                  Stack(
                    children: [
                      context.watch<ListsBloc>().isEditMode
                          ? Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: SizedBox(
                          height: 76,
                          width: 76,
                          child: SvgPicture.asset(
                            AppIcons.redBucket,
                            height: 18,
                            width: 9,
                          ),
                        ),
                      )
                          : Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
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
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(32),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(32),
                            onTap: () async{
                              if(context.read<ListsBloc>().isEditMode){
                                final confirmed = await confirmOperation(context, title: "Confirm deleting", message: "Are you sure that you want to delete selected collections?", action: "Delete", cancel: "Cancel");
                                if(!confirmed) return;
                                context.read<ListsBloc>().add(
                                    const ListsEvent.deleteSelectedCollection(
                                        collectionsList: []));
                                context.read<ListsBloc>().isEditMode = false;
                              }else{
                                dialog();
                              }
                            },
                            child: Container(
                                width: 76, height: 76, color: Colors.transparent)),
                      ),
                    ],
                  )
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
                  left: 12, top: 12, right: 12),
              child: IntrinsicHeight(
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
                            .copyWith(color:Colors.black)),
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
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                        controller: nameTextEditingController,
                        decoration: InputDecoration(
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF2B635A).withOpacity(0.15)
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF2B635A).withOpacity(0.15)
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: TextButton(
                        child: Text(AppStrings.done,
                            style: AppTheme.themeData.textTheme.labelMedium!
                                .copyWith(color: AppColors.mainAccent)),
                        onPressed: () {
                          if (nameTextEditingController.text.isNotEmpty) {
                            if(context.read<ListsBloc>().state.collectionsList!.any((element) => element.collectionName == nameTextEditingController.text )){
                            AppToast.showError(context, 'Collection with same name exists ');
                            Navigator.of(context).pop();

                            }else{
                              context.read<ListsBloc>().add(
                                  ListsEvent.createNewList(
                                      name: nameTextEditingController.text));
                              nameTextEditingController.clear();
                              Navigator.of(context).pop();
                            }

                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

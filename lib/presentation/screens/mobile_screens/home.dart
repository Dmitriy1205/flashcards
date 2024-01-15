import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/learn.dart';
import 'package:flashcards/presentation/screens/mobile_screens/profile/profile.dart';
import 'package:flashcards/presentation/widgets/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lists_screen/lists_screen.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  PageController pageController = PageController(initialPage: 0);

  int _selectedPage = 0;

  List<String> pageNames = [
    AppStrings.collections,
    AppStrings.learn,
    AppStrings.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  pageNames[_selectedPage],
                  style: AppTheme.themeData.textTheme.headlineLarge,
                ),
                _selectedPage == 0
                    ? GestureDetector(
                        onTap: () {
                          context.read<ListsBloc>().listIdToDelete.clear();
                          context.read<ListsBloc>().add(ListsEvent.started(
                              isEditMode:
                                  !context.read<ListsBloc>().isEditMode));
                        },
                        child: Text(
                          context.watch<ListsBloc>().isEditMode
                              ? AppStrings.cancel
                              : AppStrings.edit,
                          style: AppTheme.themeData.textTheme.titleLarge,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [Lists(), Learn(), Profile()],
      ),
      bottomNavigationBar: CustomNavigationBar(pageController: pageController),
    );
  }
}

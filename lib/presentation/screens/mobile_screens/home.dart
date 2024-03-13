import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/screens/mobile_screens/lists_screen/learning_mode/learn.dart';
import 'package:flashcards/presentation/screens/mobile_screens/profile/profile.dart';
import 'package:flashcards/presentation/widgets/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lists_screen/lists_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  PageController pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPage = 0;

  late List<String> pageNames = [
    AppLocalizations.of(context)!.collections,
    AppLocalizations.of(context)!.learn,
    AppLocalizations.of(context)!.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 13),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    pageNames[_selectedPage],
                    style: AppTheme.themeData.textTheme.headlineLarge,
                  ),
                  Spacer(),
                  _selectedPage == 0
                      ? GestureDetector(
                          onTap: () {
                            context.read<ListsBloc>().listIdToDelete.clear();
                            context.read<ListsBloc>().add(ListsEvent.started(
                                isEditMode:
                                    !context.read<ListsBloc>().isEditMode));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 20),
                              child: Text(
                                context.watch<ListsBloc>().isEditMode
                                    ? AppLocalizations.of(context)!.cancel
                                    : AppLocalizations.of(context)!.edit,
                                style: AppTheme.themeData.textTheme.titleLarge
                                    ?.copyWith(fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
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
        children: [
          const Lists(),
          Learn(scaffoldKey: _scaffoldKey),
          const Profile()
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(pageController: pageController),
    );
  }
}

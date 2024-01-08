import 'package:flashcards/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Lists extends StatelessWidget {
  Lists({Key? key}) : super(key: key);

  final List<String> collectionsList = [
    'Deck1',
    'English',
    'Cities',
    ' Names',
    'Memo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.background,
      body: Column(
        children: [
          SafeArea(
              child: SizedBox(
            height: 54,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 27, right: 34, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Collections'),
                Text('Edit'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.background,
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 23),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ListTile(
                          title: Text(collectionsList[i]),
                          subtitle: Text('10 cards'),
                          trailing: SvgPicture.asset(
                            'assets/icons/right_arrow.svg',
                            height: 18,
                            width: 9,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: collectionsList.length),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 284,
              height: 73,
              child: Stack(
                children: [
                  Positioned(
                    left: 24,
                    child: Container(
                      width: 254,
                      height: 73,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/hamburger.svg',
                              height: 27.5,
                              width: 30,
                            ),
                            SvgPicture.asset(
                              'assets/icons/hat.svg',
                              height: 27.5,
                              width: 30,
                            ),
                            SvgPicture.asset(
                              'assets/icons/profile.svg',
                              height: 27.5,
                              width: 30,
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 76,
          width: 76,
          child: SvgPicture.asset(
            'assets/icons/floating_action_button.svg',
            height: 18,
            width: 9,
          ),
        ),
      ),
    );
  }
}

import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cards extends StatelessWidget {
   Cards({Key? key}) : super(key: key);
  final List<String> cardsList = [
    'How can i help you with such a complicated task?',
    'Sad',
    'Happy',
    'Anxious',
    'A sleep'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: AppColors.background,
            child: ListView.builder(
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 11, top: 11),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      child: GestureDetector(onTap: (){},
                        child: ListTile(
                          title: Text(
                            cardsList[i],
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          subtitle: Text(
                            '10 cards',
                            style: AppTheme.themeData.textTheme.labelSmall!
                                .copyWith(
                              color: AppColors.mainAccent,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/icons/right_arrow.svg',
                            height: 18,
                            width: 9,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: cardsList.length),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 284,
            height: 113,
            child: Stack(
              children: [
                Positioned(
                  left: 24,
                  bottom: 34,
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
    );
  }
}

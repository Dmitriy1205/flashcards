import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/auth/auth_bloc.dart';
import 'cards/cards.dart';
import 'collections.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListsBloc, ListsState>(listener: (context, state) {
      state.maybeMap(viewCards: (selectedCollection) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Cards(
                      collectionName: selectedCollection.collectionsListName,
                    )));
      }, orElse: () {
        print('Error in bloclistener');
      });
    }, builder: (context, state) {
      return
        Container(
       child:  state.maybeMap(
           // viewCards: (collectionList) {
          // return const Collections();
        // },
          viewCollections: (collections){
         print('state changed');
         return  Collections(collectionsList: collections.collectionsList,);
       },orElse: () {
          return const Center(
            child: Text(AppStrings.noCollection),
          );
        }),
        // floatingActionButton: context.watch<ListsBloc>().isEditMode
        //     ? Padding(
        //         padding: const EdgeInsets.only(bottom: 20.0),
        //         child: GestureDetector(
        //           onTap: () {
        //             context
        //                 .read<ListsBloc>()
        //                 .add(const ListsEvent.deleteSelectedCollection());
        //             context.read<ListsBloc>().isEditMode = false;
        //           },
        //           child: SizedBox(
        //             height: 76,
        //             width: 76,
        //             child: SvgPicture.asset(
        //               AppIcons.redBucket,
        //               height: 18,
        //               width: 9,
        //             ),
        //           ),
        //         ),
        //       )
        //     : Padding(
        //         padding: const EdgeInsets.only(bottom: 20.0),
        //         child: GestureDetector(
        //           onTap: () {
        //             dialog();
        //           },
        //           child: SizedBox(
        //             height: 76,
        //             width: 76,
        //             child: SvgPicture.asset(
        //               AppIcons.addCollection,
        //               height: 18,
        //               width: 9,
        //             ),
        //           ),
        //         ),
        //       ),
      );
    });
  }


}

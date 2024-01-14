import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      );
    });
  }


}

import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/core/themes/theme.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'collections.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListsBloc, ListsState>(
      listenWhen: (previousState, state) {
        return state.maybeWhen(
            orElse: () => false, viewCards: (selectedCollection) => true);
      },
      listener: (context, state) {
        state.maybeMap(
          viewCards: (selectedCollection) {
            router.push(
              '/cards',
              extra: {
                "collectionName": selectedCollection.collection.collectionName,
                "collectionId": selectedCollection.collection.id,
              },
            );

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Cards(
            //       collectionId: selectedCollection.collection.id,
            //       collectionName: selectedCollection.collection.collectionName,
            //     ),
            //   ),
            // );
          },
          orElse: () {
            print('Error in lists bloclistener');
          },
        );
      },
      buildWhen: (previousState, state) {
        return state.maybeWhen(
          viewCollections: (collections, boolean, collectionList) => true,
          orElse: () => false,
        );
      },
      builder: (context, state) {
        return Container(
          child: state.maybeMap(
            loading: (_) => const CircularProgressIndicator(),
            error: (e) => Center(
                child: Text(
              'Error $e',
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(fontSize: 18),
            )),
            viewCollections: (collections) {
              return Collections(
                  collectionsList: collections.collectionsList,
                  isEditMode: collections.isEditMode);
            },
            orElse: () {
              return const Center(
                child: Text(AppStrings.noCollection),
              );
            },
          ),
        );
      },
    );
  }
}

// class _ListsState extends State<Lists> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ListsBloc, ListsState>(
//       listener: (context, state) {
//         state.maybeMap(
//           viewCards: (selectedCollection) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Cards(
//                   collectionName: selectedCollection.collectionsListName,
//                 ),
//               ),
//             );
//           },
//           orElse: () {
//             print('Error in bloclistener');
//           },
//         );
//       },
//       buildWhen: (previousState, state) {
//         return state.maybeWhen(
//           viewCollections: () => true,
//           orElse: () => false,
//         );
//       },
//       builder: (context, state) {
//         return Container(
//           child: state.maybeMap(
//             viewCollections: (collections) {
//               print('state changed');
//               return Collections(collectionsList: collections.collectionsList);
//             },
//             orElse: () {
//               return const Center(
//                 child: Text(AppStrings.noCollection),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

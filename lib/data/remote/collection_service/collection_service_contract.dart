import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';

abstract class CollectionServiceContract {
  Future<void> createCollection({required String collectionName});

  Future<void> deleteCollections(
      {required List<String> collectionsListToDelete});

  Future<void> fetchCollections();
  Future<void> updateCollectionName({required String id,required String name});
}

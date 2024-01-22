import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';

abstract class CollectionRepoContract {
  Future<void> createCollection({required String collectionName});

  Future<void> editCollection(
      {required String collectionName, required String collectionId});

  Future<List<CollectionEntity>> fetchCollections();

  Future<void> deleteCollections({required List<String> collections});

  Future<void> updateExistingCollection(
      {required String collectionId, required String name});
}

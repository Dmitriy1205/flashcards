import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';

abstract class CollectionRepoContract {
  Future<void> createCollection({required String collectionName});

  Future<void> fetchCollections();

  Future<void> deleteCollections({required List<CollectionEntity> collections});
}

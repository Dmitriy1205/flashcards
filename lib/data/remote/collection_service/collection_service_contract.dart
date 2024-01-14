import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';

abstract class CollectionServiceContract {
  Future<void> createCollection({required String collectionName});

  Future<void> deleteCollections(
      {required List<CollectionEntity> collectionsList});

  Future<void> fetchCollections();
}

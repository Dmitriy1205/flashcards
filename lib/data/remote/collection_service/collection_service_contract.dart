
abstract class CollectionServiceContract {
  Future<void> createCollection({required String collectionName});

  Future<void> editCollection(
      {required String collectionName, required String collectionId});

  Future<void> deleteCollections(
      {required List<String> collectionsListToDelete});

  Future<void> fetchCollections();

  Future<void> updateCollectionName({required String id, required String name});
}

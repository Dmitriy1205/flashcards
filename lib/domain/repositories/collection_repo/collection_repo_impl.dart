import 'package:flashcards/data/remote/collection_service/collection_service_impl.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_contract.dart';

class CollectionRepoImpl extends CollectionRepoContract {
  CollectionRepoImpl({required this.collectionServiceImpl});

  CollectionServiceImpl collectionServiceImpl;

  @override
  Future<void> createCollection({required String collectionName}) async {
    await collectionServiceImpl.createCollection(
        collectionName: collectionName);
  }

  @override
  Future<void> deleteCollections(
      {required List<String> collections}) async {
    await collectionServiceImpl.deleteCollections(collectionsListToDelete: collections);
  }

  @override
  Future<List<CollectionEntity>> fetchCollections() async {
    return await collectionServiceImpl.fetchCollections();
  }
}

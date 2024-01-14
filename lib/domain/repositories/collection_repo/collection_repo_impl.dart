import 'package:flashcards/data/remote/collection_service/collection_service_impl.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_contract.dart';

class CollectionRepoImpl extends CollectionRepoContract {
  CollectionRepoImpl({required this.collectionServiceImpl});

  CollectionServiceImpl collectionServiceImpl;

  @override
  Future<void> createCollection({required String collectionName}) async {
    collectionServiceImpl.createCollection(collectionName: collectionName);
  }

  @override
  Future<void> deleteCollections(
      {required List<CollectionEntity> collections}) {
    // TODO: implement deleteCollections
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionEntity>> fetchCollections() async {
   return collectionServiceImpl.fetchCollections();

  }
}

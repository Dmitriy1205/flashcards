import '../../entities/collection_pdf_entity/collection_pdf_entity.dart';

abstract class CollectionPdfRepo{
  Future<List<CollectionPdfEntity>> listCollectionPdfs({required String collectionId, required String userUid});
  Future<void> setPdfFiles({required String collectionId, required List<String> filePaths, required String userUid});
}
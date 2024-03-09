import 'dart:io';

import 'package:flashcards/data/remote/collection_pdf_service/collection_pdf_service_contract.dart';
import 'package:flashcards/domain/entities/collection_pdf_entity/collection_pdf_entity.dart';
import 'package:flashcards/domain/repositories/collection_pdf_repo/collection_pdf_repo_contract.dart';

class CollectionPdfRepoImpl implements CollectionPdfRepo{
  final CollectionPdfService collectionPdfService;
  @override
  Future<List<CollectionPdfEntity>> listCollectionPdfs({required String collectionId, required String userUid}) {
    return collectionPdfService.listCollectionPdfs(collectionId: collectionId, userUid: userUid);
  }

  @override
  Future<void> setPdfFiles({required String collectionId, required List<String> filePaths, required String userUid}) {
    return collectionPdfService.setPdfFiles(collectionId: collectionId, filePaths: filePaths, userUid: userUid);
  }

  const CollectionPdfRepoImpl({
    required this.collectionPdfService,
  });
}
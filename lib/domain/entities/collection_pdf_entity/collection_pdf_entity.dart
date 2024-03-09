import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcards/core/utils/firebase_time_stamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_pdf_entity.freezed.dart';
part 'collection_pdf_entity.g.dart';

@freezed
class CollectionPdfEntity with _$CollectionPdfEntity {
  const CollectionPdfEntity._();

  static Map<String,dynamic> createFirestoreDocument(
          {required String docId, required String path}) => {
    "id": docId,
    "path": path,
    "createdAt": FieldValue.serverTimestamp()
  };

  const factory CollectionPdfEntity({
    required String id,
    required String path,
    @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp, includeToJson: false) required DateTime createdAt,
  }) = _CollectionPdfEntity;

  factory CollectionPdfEntity.fromJson(Map<String, Object?> json)
  => _$CollectionPdfEntityFromJson(json);
}
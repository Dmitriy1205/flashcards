import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_collection_pdf_entity.freezed.dart';
part 'edit_collection_pdf_entity.g.dart';

@freezed
class EditCollectionPdfEntity with _$EditCollectionPdfEntity {
  const EditCollectionPdfEntity._();

  String get path => localPath != null ? localPath! : remoteCollectionPath!;

  const factory EditCollectionPdfEntity({
    String? localPath,
    String? remoteCollectionPath,
  }) = _EditCollectionPdfEntity;

  factory EditCollectionPdfEntity.fromJson(Map<String, Object?> json)
  => _$EditCollectionPdfEntityFromJson(json);
}
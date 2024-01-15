import 'dart:io';

class EditCardParam {
  EditCardParam(
      {required this.id,
      required this.front,
      required this.back,
      required this.collectionId,
        this.shareWithId,
      this.sharedFrom,
      this.frontImages,
      this.backImages});

  final String id;
  final String collectionId;
  final String front;
  final String back;
  final String? sharedFrom;
  final List<String>? shareWithId;
  final List<File>? frontImages;
  final List<File>? backImages;
}

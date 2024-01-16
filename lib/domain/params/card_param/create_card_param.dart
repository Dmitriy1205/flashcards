import 'dart:io';

class CreateCardParam {
  CreateCardParam(
      {required this.front,
      required this.back,
      this.frontImages,
      this.backImages,
      required this.collectionId});

  final String front;
  final String back;
  final String collectionId;
  final List<File>? frontImages;
  final List<File>? backImages;
}

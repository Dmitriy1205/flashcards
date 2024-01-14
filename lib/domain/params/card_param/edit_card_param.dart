import 'dart:io';

class EditCardParam {
  EditCardParam(
      {required this.id,required this.front,
      required this.back,
      this.frontImages,
      this.backImages});

  final String id;
  final String front;
  final String back;
  final List<File>? frontImages;
  final List<File>? backImages;
}

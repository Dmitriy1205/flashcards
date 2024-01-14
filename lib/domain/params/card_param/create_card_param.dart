import 'dart:io';

class CreateCardParam {
  CreateCardParam(
      {required this.front,
      required this.back,
      this.frontImages,
      this.backImages});

  final String front;
  final String back;
  final List<File>? frontImages;
  final List<File>? backImages;
}

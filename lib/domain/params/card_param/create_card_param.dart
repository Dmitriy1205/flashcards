
class CreateCardParam {
  CreateCardParam(
      {required this.front,
      required this.back,
      this.frontImages,
      this.backImages,
      required this.collectionId,});

  final List<Map<String,dynamic>> front;
  final List<Map<String,dynamic>> back;
  final String collectionId;
  final String? frontImages;
  final String? backImages;
}

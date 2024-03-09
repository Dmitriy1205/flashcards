
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
  final List<Map<String,dynamic>> front;
  final List<Map<String,dynamic>> back;
  final String? sharedFrom;
  final List<String>? shareWithId;
  final String? frontImages;
  final String? backImages;
}

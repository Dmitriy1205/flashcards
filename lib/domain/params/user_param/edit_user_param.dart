import 'dart:io';

class EditUserParam {
  EditUserParam(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.language,
      this.userPhoto});

  final String firstName;
  final String lastName;
  final String email;
  final String? language;
  final List<File>? userPhoto;
}

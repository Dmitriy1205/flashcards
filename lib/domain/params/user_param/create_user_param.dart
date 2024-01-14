import 'dart:io';

class CreateUserParam {
  CreateUserParam(
      {required this.firstName,
        required this.lastName,
        required this.email
    });

  final String firstName;
  final String lastName;
  final String email;
}

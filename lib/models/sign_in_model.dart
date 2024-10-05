import '../exceptions/validation_exception.dart';

class SignInModel {
  final String usernameOrEmail;
  final String password;

  SignInModel({required this.usernameOrEmail, required this.password});

  void validate() {
    List<String> errors = [];
    if (usernameOrEmail.isEmpty) {
      errors.add('Please enter your username or email.');
    }
    if (password.isEmpty) {
      errors.add('Please enter your password.');
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors);
    }
  }
}
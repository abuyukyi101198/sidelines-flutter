import '../exceptions/validation_exception.dart';

class SignUpModel {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel(
      {required this.email,
      required this.password,
      required this.confirmPassword});

  void validate() {
    List<String> errors = [];
    if (email.isEmpty) {
      errors.add('Please enter your email.');
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      errors.add('Please enter a valid email address.');
    }

    if (password.isEmpty) {
      errors.add('Please enter your password.');
    }
    if (confirmPassword.isEmpty) {
      errors.add('Please re-enter your password.');
    }
    if (password != confirmPassword) {
      errors.add('Passwords do not match.');
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors);
    }
  }
}

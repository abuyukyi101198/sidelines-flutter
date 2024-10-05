import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:sidelines/data/storage.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/deprecated/widgets/alerts/notification_bar.dart';
import 'package:sidelines/exceptions/api_exception.dart';
import 'package:sidelines/exceptions/validation_exception.dart';

import '../data/constants.dart';
import '../exceptions/runtime_exception.dart';

class SignUpViewModel extends ChangeNotifier {
  final Storage storage = Storage();

  http.Response? response;

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  void validate(String email, String password, String confirmPassword) {
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

  Future<void> signUp(BuildContext context, String email,
      String password, String confirmPassword) async {
    isLoading.value = true;

    try {
      validate(email, password, confirmPassword);
      response = await http.post(
        Uri.parse('${Constants.baseApiUrl}sign-up/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if(!context.mounted) return;
      switch(response?.statusCode) {
        case 201:
          onSuccess(context);
          break;
        default:
          throw ApiException(response);
      }
    } catch (error) {
      if (!context.mounted) return;
      if (error is RuntimeException) {
          NotificationBar.show(context, error.messages.first);
      } else {
        NotificationBar.show(context, 'An unexpected error occurred.');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void onSuccess(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/setup-journey',
          (Route<dynamic> route) => false,
    );
    await storage.write('token', jsonDecode(response!.body)['token']);
  }
}
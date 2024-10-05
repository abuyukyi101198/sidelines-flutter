import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/data/storage.dart';
import 'package:sidelines/widgets/notifications/notification_bar.dart';
import 'package:sidelines/exceptions/api_exception.dart';
import 'package:sidelines/exceptions/runtime_exception.dart';
import 'package:sidelines/exceptions/validation_exception.dart';

import '../data/constants.dart';

class SignInViewModel extends ChangeNotifier {
  final Storage storage = Storage();

  http.Response? response;

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  void validate(String usernameOrEmail, String password) {
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

  Future<void> signIn(
      BuildContext context, String usernameOrEmail, String password) async {
    isLoading.value = true;

    try {
      validate(usernameOrEmail, password);
      response = await http.post(
        Uri.parse('${Constants.baseApiUrl}sign-in/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': usernameOrEmail, 'password': password}),
      );

      if (!context.mounted) return;
      switch (response?.statusCode) {
        case 200:
          onSuccess(context);
          break;
        case 206:
          onPartialSuccess(context);
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
      '/matches',
      (Route<dynamic> route) => false,
    );
    await storage.write('token', jsonDecode(response!.body)['token']);
  }

  void onPartialSuccess(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/setup-journey',
      (Route<dynamic> route) => false,
    );
    await storage.write('token', jsonDecode(response!.body)['token']);
  }
}

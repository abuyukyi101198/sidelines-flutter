import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/data/storage.dart';
import 'package:sidelines/deprecated/widgets/alerts/notification_bar.dart';
import 'package:sidelines/exceptions/api_exception.dart';

import '../data/constants.dart';

class SignInViewModel extends ChangeNotifier {
  final Storage storage = Storage();

  http.Response? response;

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> signIn(
      BuildContext context, String usernameOrEmail, String password) async {
    isLoading.value = true;

    try {
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
      NotificationBar.show(context, error.toString());
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

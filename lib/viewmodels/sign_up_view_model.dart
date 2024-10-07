import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:sidelines/data/storage.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/widgets/notifications/notification_bar.dart';
import 'package:sidelines/exceptions/api_exception.dart';

import '../data/constants.dart';
import '../exceptions/runtime_exception.dart';
import '../models/sign_up_model.dart';

class SignUpViewModel extends ChangeNotifier {
  final Storage storage = Storage();

  http.Response? response;

  Future<void> signUp(BuildContext context, SignUpModel signUpModel) async {
    try {
      signUpModel.validate();
      response = await http.post(
        Uri.parse('${Constants.baseApiUrl}sign-up/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'email': signUpModel.email, 'password': signUpModel.password}),
      );

      if (!context.mounted) return;
      switch (response?.statusCode) {
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../data/constants.dart';
import '../../../data/storage.dart';
import '../../../widgets/notifications/notification_bar.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool Function() validate;

  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (!validate()) {
          return;
        }

        try {
          final response =
              await signUp(emailController.text, passwordController.text);
          if (!context.mounted) return;
          if (response.statusCode == 201) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/setup-journey',
              (Route<dynamic> route) => false,
            );
            await Storage().write('token', jsonDecode(response.body)['token']);
          } else {
            final Map<String, dynamic> responseData = json.decode(response.body);
            responseData.forEach((key, value) {
              if (value is List) {
                for (var error in value) {
                  if (error is String) {
                    NotificationBar.show(context, error);
                    return;
                  }
                }
              }
            });
            if (responseData.isEmpty) {
              NotificationBar.show(context, 'Sign up failed. Please try again.');
            }
          }
        } catch (e) {
          if (!context.mounted) return;
          NotificationBar.show(
              context, 'An error occurred. Please try again later.');
        }
      },
      child: const Text('Sign up'),
    );
  }

  Future<http.Response> signUp(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.baseApiUrl}signup/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    return response;
  }

  bool isValidEmail(String email) {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(email);
  }
}

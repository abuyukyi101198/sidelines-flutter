import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../data/constants.dart';
import '../../../data/storage.dart';
import '../../../widgets/notifications/notification_bar.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool Function() validate;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
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
              await signIn(emailController.text, passwordController.text);
          if (!context.mounted) return;
          if (response.statusCode == 200) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/matches',
              (Route<dynamic> route) => false,
            );
            await Storage().write('token', jsonDecode(response.body)['token']);
          } else if (response.statusCode == 206) {
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
              NotificationBar.show(context, 'Sign in failed. Please try again.');
            }
          }
        } catch (e) {
          if (!context.mounted) return;
          NotificationBar.show(
              context, 'An error occurred. Please try again later.');
        }
      },
      child: const Text('Sign in'),
    );
  }

  Future<http.Response> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.baseApiUrl}signin/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );
    return response;
  }
}

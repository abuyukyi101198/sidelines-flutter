import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/data/constants.dart';
import '../../data/storage.dart';
import '../alerts/notification_bar.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
          NotificationBar.show(context, 'Please fill all fields');
          return;
        }

        if (!isValidEmail(emailController.text)) {
          NotificationBar.show(context, 'Please enter a valid email address');
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
            final Map<String, dynamic> responseData =
                json.decode(response.body);
            final errorMessage =
                responseData['detail'] ?? 'Sign in failed. Please try again.';
            NotificationBar.show(context, errorMessage);
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

  bool isValidEmail(String email) {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(email);
  }
}

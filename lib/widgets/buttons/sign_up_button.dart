import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/data/constants.dart';
import 'package:sidelines/widgets/alerts/notification_bar.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (emailController.text.isEmpty ||
            passwordController.text.isEmpty ||
            confirmPasswordController.text.isEmpty) {
          NotificationBar.show(context, 'Please fill all fields');
          return;
        }

        if (!isValidEmail(emailController.text)) {
          NotificationBar.show(context, 'Please enter a valid email address');
          return;
        }

        if (passwordController.text != confirmPasswordController.text) {
          NotificationBar.show(context, 'Passwords do not match');
          return;
        }

        try {
          final response =
              await signUp(emailController.text, passwordController.text);
          if (!context.mounted) return;
          if (response.statusCode == 201) {
            Navigator.pushReplacementNamed(context, '/setup-journey');
          } else {
            final Map<String, dynamic> responseData =
                json.decode(response.body);
            final errorMessage =
                responseData['detail'] ?? 'Sign up failed. Please try again.';
            NotificationBar.show(context, errorMessage);
          }
        } catch (e) {
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

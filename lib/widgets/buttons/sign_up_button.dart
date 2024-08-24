import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidelines/data/constants.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill all fields')),
          );
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
                responseData['detail'] ?? 'Signup failed. Please try again.';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage)),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('An error occurred. Please try again later.')),
          );
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
}

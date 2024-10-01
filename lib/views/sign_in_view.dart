import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewmodels/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  final SignInViewModel viewModel = SignInViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.signIn(
                    context, emailController.text, passwordController.text);
              },
              child: Text('Sign In'),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: viewModel.isLoading,
              builder: (context, isLoading, child) {
                return isLoading ? CircularProgressIndicator() : SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

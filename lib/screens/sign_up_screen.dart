import 'package:flutter/material.dart';
import 'package:sidelines/widgets/buttons/sign_up_button.dart';
import 'package:sidelines/widgets/buttons/sign_up_with_apple.dart';
import 'package:sidelines/widgets/buttons/sign_up_with_google.dart';
import 'package:sidelines/widgets/display/sign_in_and_up_logo.dart';
import 'package:sidelines/widgets/fields/password_field.dart';
import 'package:sidelines/widgets/footers/sign_up_footer.dart';
import 'package:sidelines/widgets/misc/or_divider.dart';

import '../widgets/fields/email_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // TODO: Implement API call using the captured email and password
      // Example: Call the sign-up function and pass the email and password

      // After successful sign-up, navigate to the desired screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SignInAndUpLogo(),
                    EmailField(
                      label: 'Your e-mail address',
                      controller: _emailController,
                    ),
                    PasswordField(
                      label: 'Enter a password',
                      controller: _passwordController,
                    ),
                    PasswordField(
                      label: 'Re-enter your password',
                      controller: _confirmPasswordController,
                    ),
                    SignUpButton(onPressed: _signUp),
                    const OrDivider(),
                    const SignUpWithGoogle(),
                    const SizedBox(
                      height: 8,
                    ),
                    const SignUpWithApple()
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: const SignUpFooter());
  }
}

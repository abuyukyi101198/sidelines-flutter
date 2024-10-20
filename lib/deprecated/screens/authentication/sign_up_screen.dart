import 'package:flutter/material.dart';

import '../../widgets/buttons/sign_up_button.dart';
import '../../widgets/buttons/sign_up_with_apple.dart';
import '../../widgets/buttons/sign_up_with_google.dart';
import '../../widgets/display/sign_in_and_up_logo.dart';
import '../../widgets/fields/email_field.dart';
import '../../widgets/fields/password_field.dart';
import '../../widgets/footers/sign_in_or_up_footer.dart';
import '../../widgets/misc/or_divider.dart';

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

  bool validate() {
    return _formKey.currentState!.validate();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  validateConfirmPassword: _validateConfirmPassword,
                ),
                SignUpButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  validate: validate,
                ),
                const OrDivider(),
                const SignUpWithGoogle(),
                const SizedBox(height: 8),
                const SignUpWithApple(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const SignInOrUpFooter(isSignIn: false),
    );
  }
}

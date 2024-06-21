import 'package:flutter/material.dart';
import 'package:sidelines/widgets/buttons/sign_up_button.dart';
import 'package:sidelines/widgets/buttons/sign_up_with_apple.dart';
import 'package:sidelines/widgets/buttons/sign_up_with_google.dart';
import 'package:sidelines/widgets/display/sign_in_and_up_logo.dart';
import 'package:sidelines/widgets/fields/password_field.dart';
import 'package:sidelines/widgets/footers/sign_up_footer.dart';
import 'package:sidelines/widgets/misc/or_divider.dart';

import '../widgets/fields/email_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SignInAndUpLogo(),
                  EmailField(
                    label: 'Your e-mail address',
                  ),
                  PasswordField(
                    label: 'Enter a password',
                  ),
                  PasswordField(
                    label: 'Re-enter your password',
                  ),
                  SignUpButton(),
                  OrDivider(),
                  SignUpWithGoogle(),
                  SizedBox(
                    height: 8,
                  ),
                  SignUpWithApple()
                ]),
          ),
        ),
        bottomNavigationBar: SignUpFooter());
  }
}

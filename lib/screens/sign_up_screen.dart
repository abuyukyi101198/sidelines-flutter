import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/widgets/buttons/sign_up_button.dart';
import 'package:sidelines/widgets/buttons/sign_up_with_apple.dart';
import 'package:sidelines/widgets/buttons/sign_up_with_google.dart';
import 'package:sidelines/widgets/fields/password_field.dart';
import 'package:sidelines/widgets/footers/sign_up_footer.dart';
import 'package:sidelines/widgets/misc/or_divider.dart';

import '../widgets/fields/email_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 128,
                  ),
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 128,
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  const EmailField(
                    label: 'Your e-mail address',
                  ),
                  const PasswordField(
                    label: 'Enter a password',
                  ),
                  const PasswordField(
                    label: 'Re-enter your password',
                  ),
                  const SignUpButton(),
                  const OrDivider(),
                  const SignUpWithGoogle(),
                  const SizedBox(
                    height: 8,
                  ),
                  const SignUpWithApple()
                ]),
          ),
        ),
        bottomNavigationBar: const SignUpFooter());
  }
}

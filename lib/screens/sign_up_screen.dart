import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/widgets/fields/password_field.dart';

import '../widgets/fields/email_field.dart';
import '../widgets/footers/sign_in_footer.dart';

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 128,
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  const EmailField(label: 'Your e-mail address',),
                  const PasswordField(label: 'Enter a password',),
                  const PasswordField(label: 'Re-enter your password',),
                ]),
          ),
        ),
        bottomNavigationBar: const SignInFooter());
  }
}
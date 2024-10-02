import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

import '../buttons/link_button.dart';

class AuthFooter extends StatelessWidget {
  final bool isSignIn;

  final String _signInText = 'Don\'t have an account?';
  final String _signUpText = 'Already have an account?';
  final String _signInLabel = 'Sign up';
  final String _signUpLabel = 'Sign in';

  const AuthFooter({super.key, this.isSignIn = true});

  void onPressed(context) {
    Navigator.pushReplacementNamed(context, isSignIn ? '/sign-up' : '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    String effectiveText = isSignIn ? _signInText : _signUpText;
    String effectiveLabel = isSignIn ? _signInLabel : _signUpLabel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          effectiveText,
          style: TextStyle(color: GlobalTheme.colors.textColor),
        ),
        const SizedBox(
          width: 4.0,
        ),
        LinkButton(
          onPressed: () {
            onPressed(context);
          },
          label: effectiveLabel,
        )
      ],
    );
  }
}

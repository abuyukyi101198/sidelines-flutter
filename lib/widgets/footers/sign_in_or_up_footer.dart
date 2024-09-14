import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';
import '../buttons/link_button.dart';

class SignInOrUpFooter extends StatelessWidget {
  final bool isSignIn;

  final String _signInText = 'Don\'t have an account?';
  final String _signUpText = 'Already have an account?';
  final String _signInLabel = 'Sign up';
  final String _signUpLabel = 'Sign in';

  const SignInOrUpFooter({super.key, this.isSignIn = true});

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
          style: const TextStyle(color: ColorPalette.textColor),
        ),
        const SizedBox(
          width: 4,
        ),
        LinkButton(
            onPressed: () {
              onPressed(context);
            },
            label: effectiveLabel)
      ],
    );
  }
}

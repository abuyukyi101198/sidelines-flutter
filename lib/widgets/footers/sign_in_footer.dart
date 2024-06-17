import 'package:flutter/material.dart';
import 'package:sidelines/screens/sign_up_screen.dart';

import '../../utils/color_palette.dart';
import '../buttons/link_button.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  void onPressed(context) {
    Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SignUpScreen(),
          transitionDuration: const Duration(seconds: 0),
          reverseTransitionDuration: const Duration(seconds: 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(color: ColorPalette.textColor),
        ),
        const SizedBox(
          width: 4,
        ),
        LinkButton(
            onPressed: () {
              onPressed(context);
            },
            label: 'Sign up')
      ],
    );
  }
}

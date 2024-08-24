import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';
import '../buttons/link_button.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  void onPressed(context) {
    Navigator.pushNamed(context, '/sign-up');
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

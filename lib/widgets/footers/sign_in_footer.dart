import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';
import '../buttons/link_button.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

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
        LinkButton(onPressed: () {}, label: 'Sign up')
      ],
    );
  }
}

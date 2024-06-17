import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';
import '../buttons/link_button.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(color: ColorPalette.textColor),
        ),
        const SizedBox(
          width: 4,
        ),
        LinkButton(onPressed: () {}, label: 'Sign in')
      ],
    );
  }
}

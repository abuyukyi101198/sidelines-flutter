import 'package:flutter/material.dart';

import 'link_button.dart';

class ForgotPasswordLinkButton extends StatelessWidget {
  const ForgotPasswordLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: LinkButton(onPressed: () {}, label: 'Forgot password?')),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
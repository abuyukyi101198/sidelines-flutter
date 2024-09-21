import 'package:flutter/material.dart';

import '../../../utils/color_palette.dart';

class NameDisplay extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String username;

  const NameDisplay(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.username});

  @override
  Widget build(BuildContext context) {
    const fullNameStyle = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: ColorPalette.primaryColor,
    );

    const usernameStyle = TextStyle(color: ColorPalette.secondaryColor);

    return Column(
      children: [
        Text(
          '$firstName $lastName',
          style: fullNameStyle,
        ),
        Text(
          '@$username',
          style: usernameStyle,
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}

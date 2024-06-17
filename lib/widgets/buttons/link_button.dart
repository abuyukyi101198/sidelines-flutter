import 'package:flutter/material.dart';
import '../../utils/color_palette.dart';

class LinkButton extends StatelessWidget {
  final String label;

  const LinkButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          overlayColor:
          WidgetStateProperty.all(Colors.transparent)),
      child: Text(
        label,
        style: const TextStyle(
            color: ColorPalette.primaryColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
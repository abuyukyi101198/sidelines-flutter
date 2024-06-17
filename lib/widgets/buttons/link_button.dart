import 'package:flutter/material.dart';
import '../../utils/color_palette.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const LinkButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        alignment: Alignment.centerLeft,
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return const TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 2
            );
          }
          return null;
        }),
      ),
      child: Text(label, style: const TextStyle(
        color: ColorPalette.primaryColor,
        fontFamily: 'Sharp Grotesk',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      )),
    );
  }
}

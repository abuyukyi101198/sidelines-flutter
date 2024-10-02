import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart' as clr;
import 'package:sidelines/data/theme.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const LinkButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor:
            WidgetStateProperty.resolveWith((states) => clr.Colors.transparent),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        alignment: Alignment.centerLeft,
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return const TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            );
          }
          return null;
        }),
      ),
      child: Text(label,
          style: TextStyle(
            color: GlobalTheme.colors.primaryColor,
            fontFamily: 'Sharp Grotesk',
            fontSize: 12,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Divider()),
      ),
      const Text(
        "or",
        style: TextStyle(color: ColorPalette.textColor),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Divider()),
      ),
    ]);
  }
}
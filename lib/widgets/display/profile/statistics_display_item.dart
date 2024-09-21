import 'package:flutter/material.dart';

import '../../../utils/color_palette.dart';

class StatisticsDisplayItem extends StatelessWidget {
  final String label;
  final int stat;

  const StatisticsDisplayItem(
      {super.key, required this.label, required this.stat});

  final _labelStyle =
      const TextStyle(color: ColorPalette.textColor, fontSize: 16.0);

  final _valueStyle = const TextStyle(
    color: ColorPalette.textColor,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: _labelStyle,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          stat.toString(),
          style: _valueStyle,
        ),
      ],
    );
  }
}

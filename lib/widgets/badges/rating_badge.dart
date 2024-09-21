import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';

class RatingBadge extends StatelessWidget {
  final double overallRating;

  const RatingBadge({super.key, required this.overallRating});

  final _icon = const Icon(
    Icons.star_rate_rounded,
    size: 16.0,
    color: ColorPalette.textColor,
  );

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (overallRating > 6.9) {
      color = ColorPalette.successColor;
    } else if (overallRating > 3.9) {
      color = ColorPalette.warningColor;
    } else {
      color = ColorPalette.errorColor;
    }

    final BoxDecoration containerDecoration = BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    );

    final label = Text(
      overallRating.toString(),
      style: const TextStyle(
        color: ColorPalette.textColor,
        height: 1.2,
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: containerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _icon,
          const SizedBox(
            width: 2.0,
          ),
          label,
        ],
      ),
    );
  }
}

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

    final double currentRating = overallRating == 0.0 ? 6.0 : overallRating;
    if (currentRating > 6.9) {
      color = ColorPalette.successColor;
    } else if (currentRating > 3.9) {
      color = ColorPalette.warningColor;
    } else {
      color = ColorPalette.errorColor;
    }

    final BoxDecoration containerDecoration = BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    );

    final label = Text(
      currentRating.toString(),
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

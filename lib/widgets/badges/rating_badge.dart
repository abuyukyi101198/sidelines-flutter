import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

class RatingBadge extends StatelessWidget {
  final double overallRating;

  RatingBadge({super.key, required this.overallRating});

  final _icon = Icon(
    Icons.star_rate_rounded,
    size: 16.0,
    color: GlobalTheme.colors.textColor,
  );

  @override
  Widget build(BuildContext context) {
    final Color color;

    final double currentRating = overallRating == 0.0 ? 6.0 : overallRating;
    if (currentRating > 6.9) {
      color = GlobalTheme.colors.successColor;
    } else if (currentRating > 3.9) {
      color = GlobalTheme.colors.warningColor;
    } else {
      color = GlobalTheme.colors.errorColor;
    }

    final BoxDecoration containerDecoration = BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    );

    final label = Text(
      currentRating.toString(),
      style: TextStyle(
        color: GlobalTheme.colors.textColor,
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

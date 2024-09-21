import 'package:flutter/material.dart';
import 'package:sidelines/widgets/badges/rating_badge.dart';

import '../../../utils/color_palette.dart';

class ProfileDisplay extends StatelessWidget {
  final double overallRating;

  const ProfileDisplay({super.key, required this.overallRating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundColor: ColorPalette.secondaryColor,
          ),
          Positioned(
              bottom: -5,
              left: 210,
              child: RatingBadge(
                overallRating: overallRating,
              ),
          ),
        ],
      ),
    );
  }
}

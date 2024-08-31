import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';

class PositionButton extends StatelessWidget {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const PositionButton({
    super.key,
    this.left,
    this.right,
    this.top,
    this.bottom,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double radius = 24.0;
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? ColorPalette.primaryColor
                  : ColorPalette.secondaryColor,
              border: Border.all(color: ColorPalette.secondaryColor, width: 2),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? ColorPalette.secondaryColor : ColorPalette.primaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )),
      ),
    );
  }
}

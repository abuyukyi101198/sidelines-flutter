import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextInputType textInputType;

  const TextFieldWithLabel(
      {super.key,
      required this.label,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(color: ColorPalette.textColor);
    const TextStyle fieldStyle =
        TextStyle(color: ColorPalette.textColor, fontSize: 12, height: 1.0);
    InputDecoration decoration = InputDecoration(
        filled: true,
        fillColor: ColorPalette.secondaryColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none),
        isDense: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(
          height: 4,
        ),
        TextField(
            style: fieldStyle,
            keyboardType: textInputType,
            cursorColor: ColorPalette.textColor,
            decoration: decoration),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

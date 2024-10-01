import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const TextFieldWithLabel({super.key,
    required this.label,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle = TextStyle(color: ColorPalette.textColor);
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
        TextFormField(
          controller: controller,
          validator: validator,
          style: fieldStyle,
          keyboardType: textInputType,
          cursorColor: ColorPalette.textColor,
          decoration: decoration,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

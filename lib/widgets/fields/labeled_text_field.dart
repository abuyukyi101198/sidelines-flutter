import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const LabeledTextField({super.key,
    required this.label,
    this.textInputType = TextInputType.text,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = TextStyle(color: GlobalTheme.colors.textColor);
    TextStyle fieldStyle =
    TextStyle(color: GlobalTheme.colors.textColor, fontSize: 12.0, height: 1.0);
    InputDecoration decoration = InputDecoration(
        filled: true,
        fillColor: GlobalTheme.colors.secondaryColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none),
        isDense: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(
          height: 4.0,
        ),
        TextField(
          controller: controller,
          style: fieldStyle,
          keyboardType: textInputType,
          cursorColor: GlobalTheme.colors.textColor,
          decoration: decoration,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}

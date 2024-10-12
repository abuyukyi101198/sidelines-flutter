import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle fieldStyle = TextStyle(
        color: GlobalTheme.colors.textColor, fontSize: 12.0, height: 1.0);
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
        TextField(
          autofocus: true,
          style: fieldStyle,
          cursorColor: GlobalTheme.colors.textColor,
          decoration: decoration,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

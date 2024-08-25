import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:sidelines/utils/color_palette.dart';

class DateField extends StatelessWidget {
  final String? label;
  final TextEditingController dateController;

  final String _defaultLabel = 'Date';

  const DateField({super.key, this.label, required this.dateController});

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = label ?? _defaultLabel;
    const TextStyle labelStyle = TextStyle(color: ColorPalette.textColor);
    final InputDecoration inputDecoration = InputDecoration(
      constraints: const BoxConstraints(maxHeight: 36),
      filled: true,
      fillColor: ColorPalette.secondaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      suffixIcon: const Icon(
        Icons.calendar_month_rounded,
        color: ColorPalette.textColor,
        size: 12,
      ),
    );
    const TextStyle dateTextStyle = TextStyle(
      fontFamily: 'Sharp Grotesk',
      fontSize: 12,
      color: ColorPalette.textColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(effectiveLabel, style: labelStyle),
        const SizedBox(
          height: 4,
        ),
        DateTimeFormField(
          mode: DateTimeFieldPickerMode.date,
          initialValue: DateTime.now(),
          lastDate: DateTime.now(),
          onDateSelected: (DateTime dateTime) {
            dateController.text = dateTime.toString();
          },
          decoration: inputDecoration,
          dateTextStyle: dateTextStyle,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

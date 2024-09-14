import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_palette.dart';

class KitNumberField extends StatelessWidget {
  final TextEditingController kitNumberController;

  const KitNumberField({
    super.key,
    required this.kitNumberController,
  });

  @override
  Widget build(BuildContext context) {
    if (kitNumberController.text.isEmpty) {
      kitNumberController.text = '10';
    }
    const TextStyle fieldStyle = TextStyle(
      color: ColorPalette.primaryColor,
      fontSize: 36,
      fontWeight: FontWeight.w700,
    );
    InputDecoration decoration = InputDecoration(
      filled: true,
      fillColor: ColorPalette.secondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      isDense: false,
    );

    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 96,
            child: TextFormField(
              style: fieldStyle,
              controller: kitNumberController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              cursorColor: ColorPalette.textColor,
              decoration: decoration,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                NumericalRangeFormatter(min: 1, max: 99),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Kit Number',
            style: TextStyle(
              color: ColorPalette.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return const TextEditingValue().copyWith(text: min.toStringAsFixed(0));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}

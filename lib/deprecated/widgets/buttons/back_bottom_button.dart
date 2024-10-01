import 'package:flutter/material.dart';
import 'package:sidelines/deprecated/widgets/buttons/secondary_filled_button.dart';

class BackBottomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  final String _defaultText = 'Back';

  const BackBottomButton({super.key, this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final String effectiveText = text ?? _defaultText;
    return SecondaryFilledButton(
        onPressed: onPressed, child: Text(effectiveText));
  }
}

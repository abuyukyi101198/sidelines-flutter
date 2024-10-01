import 'package:flutter/material.dart';

class NextBottomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  final String _defaultText = 'Next';

  const NextBottomButton({super.key, this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final String effectiveText = text ?? _defaultText;
    return FilledButton(onPressed: onPressed, child: Text(effectiveText));
  }
}

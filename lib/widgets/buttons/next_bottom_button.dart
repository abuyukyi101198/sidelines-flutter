import 'package:flutter/material.dart';

class NextBottomButton extends StatelessWidget {
  final String? text;

  final String _defaultText = 'Next';

  const NextBottomButton({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final String effectiveText = text ?? _defaultText;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(onPressed: () {}, child: Text(effectiveText)),
            const SizedBox(
              height: 48,
            ),
          ],
        ));
  }
}

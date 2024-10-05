import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

class SetupJourneyFooter extends StatelessWidget {
  final int index;
  final void Function()? onNext;
  final void Function()? onBack;

  const SetupJourneyFooter({
    super.key,
    required this.index,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    String? effectiveNextLabel = 'Next';
    if (index == 0) {
      effectiveNextLabel = 'Let\'s get started!';
    } else if (index == 3) {
      effectiveNextLabel = 'Complete';
    }
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              if (index > 0)
                Expanded(
                    child: FilledButton(
                      onPressed: onBack,
                      style: FilledButton.styleFrom(
                          foregroundColor: GlobalTheme.colors.textColor,
                          backgroundColor: GlobalTheme.colors.secondaryColor,
                          textStyle: const TextStyle(
                              fontFamily: 'Sharp Grotesk',
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      child: const Text('Back'),
                    )),
              if (index > 0)
                const SizedBox(
                  width: 12,
                ),
              Expanded(
                  child: FilledButton(
                    onPressed: onNext,
                    child: Text(effectiveNextLabel),
                  )),
            ]),
            const SizedBox(
              height: 48,
            ),
          ],
        ));
  }
}

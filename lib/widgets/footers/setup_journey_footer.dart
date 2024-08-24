import 'package:flutter/material.dart';
import 'package:sidelines/widgets/buttons/back_bottom_button.dart';
import 'package:sidelines/widgets/buttons/next_bottom_button.dart';

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
    final String? effectiveNextLabel =
        index == 0 ? 'Let\'s get started!' : null;
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
                    child: BackBottomButton(
                  onPressed: onBack,
                )),
              if (index > 0)
                const SizedBox(
                  width: 12,
                ),
              Expanded(
                  child: NextBottomButton(
                text: effectiveNextLabel,
                onPressed: onNext,
              )),
            ]),
            const SizedBox(
              height: 48,
            ),
          ],
        ));
  }
}

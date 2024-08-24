import 'package:flutter/material.dart';
import 'package:sidelines/widgets/buttons/back_bottom_button.dart';
import 'package:sidelines/widgets/buttons/next_bottom_button.dart';

class SetupJourneyFooter extends StatelessWidget {
  final void Function()? onNext;
  final void Function()? onBack;

  const SetupJourneyFooter({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Expanded(
                  child: BackBottomButton(
                onPressed: onBack,
              )),
              Expanded(
                  child: NextBottomButton(
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

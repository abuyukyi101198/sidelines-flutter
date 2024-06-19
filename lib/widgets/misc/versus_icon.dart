import 'package:flutter/cupertino.dart';

import '../../utils/color_palette.dart';

class VersusIcon extends StatelessWidget {
  const VersusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(left: 8, top: 1, right: 8, bottom: 1),
          decoration: BoxDecoration(
              border: Border.all(color: ColorPalette.backgroundColor),
              borderRadius: BorderRadius.circular(12)),
          child: const Text(
            'vs',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

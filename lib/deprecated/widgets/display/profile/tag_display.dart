import 'package:flutter/material.dart';

import '../../tags/profile_tag.dart';

class TagDisplay extends StatelessWidget {
  final String positionData;
  final String numberData;
  final String playedData;
  final String ageData;
  final String joinData;

  const TagDisplay(
      {super.key,
      required this.positionData,
      required this.numberData,
      required this.playedData,
      required this.ageData,
      required this.joinData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileTag(type: 'position', data: positionData),
            const SizedBox(
              width: 12.0,
            ),
            ProfileTag(type: 'number', data: numberData),
            const SizedBox(
              width: 12.0,
            ),
            ProfileTag(type: 'played', data: playedData),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileTag(type: 'age', data: ageData),
            const SizedBox(
              width: 12.0,
            ),
            ProfileTag(type: 'join', data: joinData),
          ],
        ),
        const SizedBox(
          height: 36.0,
        ),
      ],
    );
  }
}

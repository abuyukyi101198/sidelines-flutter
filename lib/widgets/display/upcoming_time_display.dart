import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sidelines/widgets/misc/versus_icon.dart';

import '../../utils/color_palette.dart';

class UpcomingTimeDisplay extends StatelessWidget {
  final DateTime matchDateTime;

  late final String matchHour;

  late final String matchDateString;

  UpcomingTimeDisplay({super.key, required this.matchDateTime}) {
    matchHour = DateFormat.Hm().format(matchDateTime);
    matchDateString = _getMatchDate(matchDateTime);
  }

  String _getMatchDate(DateTime matchDateTime) {
    DateTime today = DateTime.now();
    int numberOfDaysFromMatchDay =
        (matchDateTime.difference(today).inHours / 24).round();

    if (numberOfDaysFromMatchDay < 1) {
      return 'Today';
    } else if (numberOfDaysFromMatchDay < 2) {
      return 'Tomorrow';
    } else if (numberOfDaysFromMatchDay < 7) {
      return DateFormat.EEEE().format(matchDateTime);
    }
    return DateFormat.Md().format(matchDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Column(
          children: [
            Text(
              matchHour,
              style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.w700, height: 1),
            ),
            Text(matchDateString),
          ],
        ),
        const VersusIcon(),
      ],
    ));
  }
}
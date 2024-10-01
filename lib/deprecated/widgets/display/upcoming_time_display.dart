import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../misc/versus_icon.dart';

class UpcomingTimeDisplay extends StatelessWidget {
  final DateTime matchDateTime;

  late final String matchHour;

  late final String matchDateString;

  UpcomingTimeDisplay({super.key, required this.matchDateTime}) {
    matchHour = DateFormat.Hm().format(matchDateTime);
    matchDateString = _getMatchDate(matchDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Text(
              matchHour,
              style: const TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w700, height: 1),
            ),
            Text(matchDateString),
          ],
        ),
        const VersusIcon(),
      ],
    ));
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
}

import 'package:flutter/material.dart';
import 'package:sidelines/deprecated/widgets/display/profile/statistics_display_item.dart';

class StatisticsDisplay extends StatelessWidget {
  final int goalsData;
  final int assistsData;
  final int mvpData;

  const StatisticsDisplay(
      {super.key,
      required this.goalsData,
      required this.assistsData,
      required this.mvpData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatisticsDisplayItem(label: 'Goals', stat: goalsData),
        const SizedBox(
          width: 76.0,
        ),
        StatisticsDisplayItem(label: 'Assists', stat: assistsData),
        const SizedBox(
          width: 76.0,
        ),
        StatisticsDisplayItem(label: 'MVP', stat: mvpData),
      ],
    );
  }
}

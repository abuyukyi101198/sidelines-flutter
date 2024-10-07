import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

class ProfileStatisticsDisplayItem extends StatelessWidget {
  final String label;
  final int stat;

  ProfileStatisticsDisplayItem(
      {super.key, required this.label, required this.stat});

  final _labelStyle =
      TextStyle(color: GlobalTheme.colors.textColor, fontSize: 16.0);

  final _valueStyle = TextStyle(
    color: GlobalTheme.colors.textColor,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.0,
      child: Column(
        children: [
          Text(
            label,
            style: _labelStyle,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            stat.toString(),
            style: _valueStyle,
          ),
        ],
      ),
    );
  }
}

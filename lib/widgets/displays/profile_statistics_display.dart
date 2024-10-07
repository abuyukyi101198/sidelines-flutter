import 'package:flutter/material.dart';
import 'package:sidelines/models/profile_model.dart';
import 'package:sidelines/widgets/displays/profile_statistics_display_item.dart';

class ProfileStatisticsDisplay extends StatelessWidget {
  final ProfileModel profileModel;

  const ProfileStatisticsDisplay({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileStatisticsDisplayItem(label: 'Goals', stat: profileModel.goals!),
        const SizedBox(
          width: 76.0,
        ),
        ProfileStatisticsDisplayItem(
            label: 'Assists', stat: profileModel.assists!),
        const SizedBox(
          width: 76.0,
        ),
        ProfileStatisticsDisplayItem(label: 'MVP', stat: profileModel.mvp!),
      ],
    );
  }
}

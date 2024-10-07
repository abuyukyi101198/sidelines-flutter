import 'package:flutter/material.dart';
import 'package:sidelines/models/profile_model.dart';
import 'package:sidelines/widgets/badges/profile_info_badge.dart';

class ProfileInfoDisplay extends StatelessWidget {
  final ProfileModel profileModel;

  const ProfileInfoDisplay({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileInfoBadge(
                type: 'position', data: profileModel.formatPosition()),
            const SizedBox(
              width: 12.0,
            ),
            ProfileInfoBadge(
                type: 'number', data: profileModel.kitNumber.toString()),
            const SizedBox(
              width: 12.0,
            ),
            ProfileInfoBadge(type: 'played', data: '23'),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileInfoBadge(type: 'age', data: profileModel.calculateAge()),
            const SizedBox(
              width: 12.0,
            ),
            ProfileInfoBadge(type: 'join', data: profileModel.formatJoinDate()),
          ],
        ),
        const SizedBox(
          height: 36.0,
        ),
      ],
    );
  }
}

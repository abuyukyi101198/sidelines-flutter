import 'package:flutter/material.dart';
import 'package:sidelines/deprecated/widgets/display/team_badge.dart';

class UpcomingTeamDisplay extends StatelessWidget {
  final String teamName;
  final String? teamBadgeUrl;

  late final TeamBadge teamBadge;

  UpcomingTeamDisplay({super.key, required this.teamName, this.teamBadgeUrl}) {
    teamBadge = TeamBadge(teamName: teamName, teamBadgeUrl: teamBadgeUrl, radius: 36);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      child: Column(
        children: [
          Center(child: teamBadge),
          const SizedBox(
            height: 8,
          ),
          Text(
            teamName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

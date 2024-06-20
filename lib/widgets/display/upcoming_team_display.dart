import 'package:flutter/material.dart';

class UpcomingTeamDisplay extends StatelessWidget {
  final String teamName;
  final String? teamBadgeUrl;

  late final CircleAvatar teamBadge;

  UpcomingTeamDisplay({super.key, required this.teamName, this.teamBadgeUrl}) {
    if (teamBadgeUrl != null) {
      teamBadge = CircleAvatar(
        radius: 36,
        foregroundImage: NetworkImage(teamBadgeUrl!),
      );
    } else {
      teamBadge = CircleAvatar(
        radius: 36,
        backgroundColor: _generateTeamColor(teamName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: teamBadge),
        const SizedBox(
          height: 8,
        ),
        Text(
          teamName,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  Color _generateTeamColor(String input) {
    int hash = 0;
    for (int i = 0; i < input.length; i++) {
      hash = input.codeUnitAt(i) + ((hash << 5) - hash);
    }

    String hexColor = (hash & 0xFFFFFF).toRadixString(16).padLeft(6, '0');
    return Color(int.parse("FF$hexColor", radix: 16));
  }
}

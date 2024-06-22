import 'package:flutter/material.dart';

class TeamBadge extends StatelessWidget {
  final String? teamName;
  final String? teamBadgeUrl;
  final double radius;
  final Color? teamColor;

  const TeamBadge(
      {super.key,
      this.teamName,
      this.teamBadgeUrl,
      required this.radius,
      this.teamColor})
      : assert(teamBadgeUrl != null || (teamName != null || teamColor != null));

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: _generateNetworkImageOfBadge(teamBadgeUrl),
      backgroundColor: _generateBackgroundColor(teamBadgeUrl, teamName, teamColor),
    );
  }

  NetworkImage? _generateNetworkImageOfBadge(String? url) {
    if (url != null) {
      return NetworkImage(url);
    }
    return null;
  }

  Color? _generateBackgroundColor(String? url, String? name, Color? color) {
    if (url != null) {
      return null;
    }

    assert(name != null || color != null);

    if (color != null) {
      return color;
    }
    return _generateTeamColor(name!);
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

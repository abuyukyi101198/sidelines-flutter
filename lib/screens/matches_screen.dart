import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/misc/navigation_item.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches', style: TextStyle(fontWeight: FontWeight.w700),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          NavigationItem(iconPath: 'assets/icons/matches.svg'),
          NavigationItem(iconPath: 'assets/icons/teams.svg'),
          NavigationItem(iconPath: 'assets/icons/arrange.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
        ],
      ),
    );
  }
}
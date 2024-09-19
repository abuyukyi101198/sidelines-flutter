import 'package:flutter/material.dart';
import 'package:sidelines/widgets/misc/navigation_item.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ios_share),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: 10,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          NavigationItem(iconPath: 'assets/icons/matches.svg'),
          NavigationItem(iconPath: 'assets/icons/teams.svg'),
          NavigationItem(iconPath: 'assets/icons/arrange.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
        ],
      ),
    );
  }
}

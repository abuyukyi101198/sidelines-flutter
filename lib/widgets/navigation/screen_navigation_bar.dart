import 'package:flutter/material.dart';
import 'navigation_item.dart';

class ScreenNavigationBar extends StatelessWidget {
  final int currentIndex;
  final String? profilePictureUrl;

  const ScreenNavigationBar({
    super.key,
    required this.currentIndex,
    this.profilePictureUrl,
  });

  void onTap(BuildContext context, int toIndex) {
    String route;
    switch (toIndex) {
      case 0:
        route = '/matches';
        break;
      case 1:
        route = '/teams';
        break;
      case 2:
        route = '/arrange';
        break;
      case 3:
        route = '/friends';
        break;
      case 4:
        route = '/profile';
        break;
      default:
        return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (toIndex) {
        onTap(context, toIndex);
      },
      items: [
        NavigationItem(iconPath: 'assets/icons/matches.svg'),
        NavigationItem(iconPath: 'assets/icons/teams.svg'),
        NavigationItem(iconPath: 'assets/icons/arrange.svg'),
        NavigationItem(iconPath: 'assets/icons/friends.svg'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: profilePictureUrl != null
                ? NetworkImage(profilePictureUrl!)
                : null,
          ),
          label: '',
        ),
      ],
    );
  }
}

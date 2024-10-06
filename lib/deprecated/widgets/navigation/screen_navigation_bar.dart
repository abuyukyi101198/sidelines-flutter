import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/profile_provider.dart';
import '../../utils/color_palette.dart';
import 'navigation_item.dart';

class ScreenNavigationBar extends StatelessWidget {
  final int currentIndex;

  const ScreenNavigationBar({
    super.key,
    required this.currentIndex,
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
    final profilePictureUrl =
        Provider.of<ProfileProvider>(context).profilePictureUrl;

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
          icon: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPalette.secondaryColor,
              border: currentIndex == 4 ? Border.all(
                color: ColorPalette.primaryColor,
                width: 2.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignOutside,
              ) : null,
              image: profilePictureUrl != null
                  ? DecorationImage(
                      image: NetworkImage(profilePictureUrl) as ImageProvider,
                      fit: BoxFit.cover)
                  : null,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}

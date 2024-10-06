import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/theme.dart';

class NavigationItem extends BottomNavigationBarItem {
  NavigationItem({
    super.key,
    required String iconPath,
  }) : super(
            icon: _generateIcon(iconPath),
            activeIcon: _generateActiveIcon(iconPath),
            label: '',
            backgroundColor: GlobalTheme.colors.backgroundColor);

  static Widget _generateIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      colorFilter:
          ColorFilter.mode(GlobalTheme.colors.secondaryColor, BlendMode.srcIn),
    );
  }

  static Widget _generateActiveIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      colorFilter:
          ColorFilter.mode(GlobalTheme.colors.primaryColor, BlendMode.srcIn),
    );
  }
}

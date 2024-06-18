import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_palette.dart';

class NavigationItem extends BottomNavigationBarItem {
  NavigationItem({
    super.key,
    required String iconPath,
  }) : super(
            icon: _generateIcon(iconPath),
            activeIcon: _generateActiveIcon(iconPath),
            label: '',
            backgroundColor: ColorPalette.backgroundColor);

  static Widget _generateIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      colorFilter:
          const ColorFilter.mode(ColorPalette.secondaryColor, BlendMode.srcIn),
    );
  }

  static Widget _generateActiveIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      colorFilter:
          const ColorFilter.mode(ColorPalette.primaryColor, BlendMode.srcIn),
    );
  }
}

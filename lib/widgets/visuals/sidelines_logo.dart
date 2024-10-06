import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SidelinesLogo extends StatelessWidget {
  final EdgeInsets margin;
  final double width;
  final bool isIcon;

  const SidelinesLogo(
      {super.key,
      this.margin = const EdgeInsets.all(0.0),
      this.width = 48.0,
      this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    String asset = isIcon ? 'assets/icon.svg' : 'assets/logo.svg';
    return Padding(
      padding: margin,
      child: SvgPicture.asset(
        asset,
        width: width,
      ),
    );
  }
}

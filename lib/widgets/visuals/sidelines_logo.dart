import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SidelinesLogo extends StatelessWidget {
  final EdgeInsets margin;
  final double width;

  const SidelinesLogo(
      {super.key, this.margin = const EdgeInsets.all(0.0), this.width = 48.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SvgPicture.asset(
        'assets/logo.svg',
        width: width,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';

class ProfileTag extends StatelessWidget {
  final String? type;
  final String data;

  const ProfileTag({super.key, this.type = 'position', required this.data});

  final _padding = const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0);

  final _decoration = const BoxDecoration(
    color: ColorPalette.secondaryColor,
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  );

  final _style = const TextStyle(color: ColorPalette.textColor, height: 1.0);

  String generateLabel(String type, String data) {
    switch (type) {
      case 'position':
        return data;
      case 'number':
        return 'Number $data';
      case 'played':
        return '$data matches played';
      case 'age':
        return '$data years old';
      case 'join':
        return 'Since $data';
      default:
        return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: _decoration,
      child: Text(
        generateLabel(type!, data),
        style: _style,
      ),
    );
  }
}

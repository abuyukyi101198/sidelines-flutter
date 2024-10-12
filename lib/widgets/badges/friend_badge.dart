import 'package:flutter/cupertino.dart';

import '../../data/theme.dart';

class FriendBadge extends StatelessWidget {
  final String label;

  FriendBadge({super.key, required this.label});

  final _padding = const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0);

  final _decoration = BoxDecoration(
    color: GlobalTheme.colors.secondaryColor,
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  );

  final _style = TextStyle(
      color: GlobalTheme.colors.textColor, height: 1.1, fontSize: 8.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: _decoration,
      child: Text(
        label,
        style: _style,
      ),
    );
  }
}

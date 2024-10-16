import 'package:flutter/material.dart';

import '../../data/theme.dart';

class OtherProfileActionDisplay extends StatelessWidget {
  final bool isConnected;

  const OtherProfileActionDisplay({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    final String label = isConnected ? 'Connected' : 'Connect';
    final Icon? icon =
        isConnected ? const Icon(Icons.check_rounded, size: 16.0) : null;
    return Column(
      children: [
        FilledButton.icon(
          onPressed: () {},
          style: FilledButton.styleFrom(
              foregroundColor: GlobalTheme.colors.textColor,
              backgroundColor: GlobalTheme.colors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
                side: BorderSide(
                  color: GlobalTheme.colors.textColor,
                ),
              ),
              textStyle: const TextStyle(
                  fontFamily: 'Sharp Grotesk',
                  fontWeight: FontWeight.normal,
                  fontSize: 12)),
          label: Text(label),
          icon: icon,
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}

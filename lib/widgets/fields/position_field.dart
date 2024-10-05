import 'package:flutter/material.dart';

import '../../deprecated/utils/color_palette.dart';
import '../../deprecated/widgets/buttons/position_button.dart';

class PositionField extends StatefulWidget {
  final Set<String> positionController;

  const PositionField({
    super.key,
    required this.positionController,
  });

  @override
  PositionFieldState createState() => PositionFieldState();
}

class PositionFieldState extends State<PositionField> {
  final List<Map<String, dynamic>> positions = [
    {'text': 'ST', 'top': 36.0},
    {'text': 'LW', 'left': 102.0, 'top': 48.0},
    {'text': 'RW', 'right': 102.0, 'top': 48.0},
    {'text': 'CM', 'top': 80.0},
    {'text': 'LB', 'left': 86.0, 'bottom': 86.0},
    {'text': 'RB', 'right': 86.0, 'bottom': 86.0},
    {'text': 'CB', 'bottom': 76.0},
    {'text': 'GK', 'bottom': 38.0},
  ];

  void _onPositionTapped(String position) {
    setState(() {
      if (widget.positionController.contains(position)) {
        widget.positionController.remove(position);
      } else {
        widget.positionController.add(position);
      }
    });
  }

  String _displaySelectedPosition(Set<String> positionController) {
    List<String> selected = [];
    for (Map<String, dynamic> position in positions) {
      if (positionController.contains(position['text'])) {
        selected.add(position['text']);
      }
    }
    if (selected.isNotEmpty) {
      if (selected.length == positions.length) {
        return 'ANY';
      }
      return selected.join('/');
    }
    return 'Select a position';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/field.png',
              fit: BoxFit.contain,
            ),
            for (var pos in positions)
              PositionButton(
                text: pos['text']!,
                isSelected:
                widget.positionController.contains(pos['text']!),
                onTap: () => _onPositionTapped(pos['text']!),
                top: pos['top'],
                left: pos['left'],
                right: pos['right'],
                bottom: pos['bottom'],
              ),
          ],
        ),
        Center(
          child: Text(
            _displaySelectedPosition(widget.positionController),
            style: const TextStyle(
              color: ColorPalette.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
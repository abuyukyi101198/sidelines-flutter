import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/buttons/position_button.dart';

class PlayerInfoScreen extends StatefulWidget {
  final Set<String> positionController;

  const PlayerInfoScreen({
    super.key,
    required this.positionController,
  });

  @override
  PlayerInfoScreenState createState() => PlayerInfoScreenState();
}

class PlayerInfoScreenState extends State<PlayerInfoScreen> {
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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Player Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Finally, let’s set what position you play and with what number on your back.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

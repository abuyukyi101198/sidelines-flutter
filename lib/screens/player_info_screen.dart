import 'package:flutter/material.dart';
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
  void _onPositionTapped(String position) {
    setState(() {
      if (widget.positionController.contains(position)) {
        widget.positionController
            .remove(position);
      } else {
        widget.positionController.add(position);
      }
    });
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
                  height: 36,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/field.png',
                      fit: BoxFit.contain,
                    ),
                    PositionButton(
                        top: 36,
                        text: 'ST',
                        isSelected: widget.positionController.contains('ST'),
                        onTap: () {
                          _onPositionTapped('ST');
                        }),
                    PositionButton(
                        left: 102,
                        top: 48,
                        text: 'LW',
                        isSelected: widget.positionController.contains('LW'),
                        onTap: () {
                          _onPositionTapped('LW');
                        }),
                    PositionButton(
                        right: 102,
                        top: 48,
                        text: 'RW',
                        isSelected: widget.positionController.contains('RW'),
                        onTap: () {
                          _onPositionTapped('RW');
                        }),
                    PositionButton(
                        top: 80,
                        text: 'CM',
                        isSelected: widget.positionController.contains('CM'),
                        onTap: () {
                          _onPositionTapped('CM');
                        }),
                    PositionButton(
                        left: 86,
                        bottom: 86,
                        text: 'LB',
                        isSelected: widget.positionController.contains('LB'),
                        onTap: () {
                          _onPositionTapped('LB');
                        }),
                    PositionButton(
                        right: 86,
                        bottom: 86,
                        text: 'RB',
                        isSelected: widget.positionController.contains('RB'),
                        onTap: () {
                          _onPositionTapped('RB');
                        }),
                    PositionButton(
                        bottom: 76,
                        text: 'CB',
                        isSelected: widget.positionController.contains('CB'),
                        onTap: () {
                          _onPositionTapped('CB');
                        }),
                    PositionButton(
                        bottom: 38,
                        text: 'GK',
                        isSelected: widget.positionController.contains('GK'),
                        onTap: () {
                          _onPositionTapped('GK');
                        }),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

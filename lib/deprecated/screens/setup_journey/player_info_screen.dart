import 'package:flutter/material.dart';

import '../../widgets/fields/kit_number_field.dart';
import '../../widgets/fields/position_field.dart';

class PlayerInfoScreen extends StatefulWidget {
  final Set<String> positionController;
  final TextEditingController kitNumberController;

  const PlayerInfoScreen({
    super.key,
    required this.positionController,
    required this.kitNumberController,
  });

  @override
  PlayerInfoScreenState createState() => PlayerInfoScreenState();
}

class PlayerInfoScreenState extends State<PlayerInfoScreen> {
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
              const SizedBox(
                height: 96,
              ),
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
              PositionField(
                positionController: widget.positionController,
              ),
              KitNumberField(
                kitNumberController: widget.kitNumberController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

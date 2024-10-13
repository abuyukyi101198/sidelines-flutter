import 'package:flutter/material.dart';

import '../../../../widgets/fields/kit_number_field.dart';
import '../../../../widgets/fields/position_field.dart';
import '../../data/theme.dart';

class PlayerInfoView extends StatefulWidget {
  final Set<String> positionController;
  final TextEditingController kitNumberController;

  const PlayerInfoView({
    super.key,
    required this.positionController,
    required this.kitNumberController,
  });

  @override
  PlayerInfoViewState createState() => PlayerInfoViewState();
}

class PlayerInfoViewState extends State<PlayerInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Player Information',
                style: TextStyle(
                  color: GlobalTheme.colors.textColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Finally, let’s set what position you play and with what number on your back.',
                style: TextStyle(
                  color: GlobalTheme.colors.textColor,
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

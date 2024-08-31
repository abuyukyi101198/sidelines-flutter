import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidelines/widgets/fields/position_field.dart';

import '../utils/color_palette.dart';

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
  @override
  Widget build(BuildContext context) {
    const TextStyle fieldStyle = TextStyle(
      color: ColorPalette.primaryColor,
      fontSize: 36,
      fontWeight: FontWeight.w700,
    );

    InputDecoration decoration = InputDecoration(
      filled: true,
      fillColor: ColorPalette.secondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      isDense: false,
    );

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
              PositionField(positionController: widget.positionController),
              Center(
                  child: Column(
                children: [
                  SizedBox(
                    width: 96,
                    child: TextFormField(
                      initialValue: '1',
                      style: fieldStyle,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      cursorColor: ColorPalette.textColor,
                      decoration: decoration,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                        NumericalRangeFormatter(min: 1, max: 99),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Kit Number',
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return const TextEditingValue().copyWith(text: min.toStringAsFixed(0));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}

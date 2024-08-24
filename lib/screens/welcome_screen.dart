import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorPalette.backgroundColor, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height - 10));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: MediaQuery.of(context).size.height, // Full screen height
              width: MediaQuery.of(context).size.width, // Full screen width
              child: Image.asset(
                'assets/images/welcome.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Welcome to the squad!',
                    style: TextStyle(
                      color: ColorPalette.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Now that you have created your account, let’s set up your profile.',
                    style: TextStyle(
                      color: ColorPalette.textColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

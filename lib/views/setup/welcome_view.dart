import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart' as clr;
import 'package:sidelines/data/theme.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  GlobalTheme.colors.backgroundColor,
                  clr.Colors.transparent
                ],
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
          Center(
            child: SafeArea(
              minimum: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Welcome to the squad!',
                    style: TextStyle(
                      color: GlobalTheme.colors.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Now that you have created your account, let’s set up your profile.',
                    style: TextStyle(
                      color: GlobalTheme.colors.textColor,
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

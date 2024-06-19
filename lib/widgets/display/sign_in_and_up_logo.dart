import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SignInAndUpLogo extends StatelessWidget {
  const SignInAndUpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 128,
        ),
        SvgPicture.asset(
          'assets/logo.svg',
          width: 128,
        ),
        const SizedBox(
          height: 54,
        ),
      ],
    );
  }
}
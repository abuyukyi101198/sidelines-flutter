import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/widgets/buttons/secondary_filled_button.dart';

class SignUpWithApple extends StatelessWidget {
  const SignUpWithApple({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryFilledButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/apple.svg'),
      child: const Text('Sign up with Apple'),
    );
  }
}

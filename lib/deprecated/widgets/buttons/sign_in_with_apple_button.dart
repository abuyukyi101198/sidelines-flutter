import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/deprecated/widgets/buttons/secondary_filled_button.dart';

class SignInWithAppleButton extends StatelessWidget {
  const SignInWithAppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryFilledButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/apple.svg'),
      child: const Text('Sign in with Apple'),
    );
  }
}

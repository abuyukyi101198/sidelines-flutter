import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/widgets/buttons/secondary_filled_button.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryFilledButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/google.svg',
      ),
      child: const Text('Sign in with Google'),
    );
  }
}

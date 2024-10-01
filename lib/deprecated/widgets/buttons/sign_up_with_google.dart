import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/deprecated/widgets/buttons/secondary_filled_button.dart';

class SignUpWithGoogle extends StatelessWidget {
  const SignUpWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryFilledButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/google.svg',
      ),
      child: const Text('Sign up with Google'),
    );
  }
}

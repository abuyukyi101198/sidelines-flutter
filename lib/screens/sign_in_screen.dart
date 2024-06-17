import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/buttons/forgot_password_link_button.dart';
import '../widgets/buttons/sign_in_button.dart';
import '../widgets/buttons/sign_in_with_apple_button.dart';
import '../widgets/buttons/sign_in_with_google_button.dart';
import '../widgets/fields/email_field.dart';
import '../widgets/fields/password_field.dart';
import '../widgets/footers/sign_in_footer.dart';
import '../widgets/misc/or_divider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 128,
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  const EmailField(),
                  const PasswordField(),
                  const ForgotPasswordLinkButton(),
                  const SignInButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  const OrDivider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignInWithGoogleButton(),
                  const SizedBox(
                    height: 8,
                  ),
                  const SignInWithAppleButton()
                ]),
          ),
        ),
        bottomNavigationBar: const SignInFooter());
  }
}

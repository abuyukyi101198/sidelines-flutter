import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidelines/widgets/display/sign_in_and_up_logo.dart';
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
    return const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SignInAndUpLogo(),
                  EmailField(),
                  PasswordField(),
                  ForgotPasswordLinkButton(),
                  SignInButton(),
                  OrDivider(),
                  SignInWithGoogleButton(),
                  SizedBox(
                    height: 8,
                  ),
                  SignInWithAppleButton()
                ]),
          ),
        ),
        bottomNavigationBar: SignInFooter());
  }
}

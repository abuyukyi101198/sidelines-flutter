import 'package:flutter/material.dart';
import '../../widgets/buttons/forgot_password_link_button.dart';
import '../../widgets/buttons/sign_in_button.dart';
import '../../widgets/buttons/sign_in_with_apple_button.dart';
import '../../widgets/buttons/sign_in_with_google_button.dart';
import '../../widgets/display/sign_in_and_up_logo.dart';
import '../../widgets/fields/email_field.dart';
import '../../widgets/fields/password_field.dart';
import '../../widgets/footers/sign_in_or_up_footer.dart';
import '../../widgets/misc/or_divider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SignInAndUpLogo(),
                    EmailField(
                      label: 'Username/E-mail',
                      controller: _emailController,
                      allowUsername: true,
                    ),
                    PasswordField(
                      controller: _passwordController,
                    ),
                    const ForgotPasswordLinkButton(),
                    SignInButton(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      validate: validate,
                    ),
                    const OrDivider(),
                    const SignInWithGoogleButton(),
                    const SizedBox(
                      height: 8,
                    ),
                    const SignInWithAppleButton()
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: const SignInOrUpFooter(isSignIn: true,));
  }
}

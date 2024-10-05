import 'package:flutter/material.dart';
import 'package:sidelines/models/sign_in_model.dart';
import 'package:sidelines/widgets/buttons/link_button.dart';
import 'package:sidelines/widgets/fields/labeled_text_field.dart';
import 'package:sidelines/widgets/footers/auth_footer.dart';
import 'package:sidelines/widgets/visuals/sidelines_logo.dart';

import '../viewmodels/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  final SignInViewModel viewModel = SignInViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SidelinesLogo(
                margin: EdgeInsets.only(top: 128.0, bottom: 54.0),
                width: 128.0,
              ),
              LabeledTextField(
                label: 'Username/E-mail',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              LabeledTextField(
                label: 'Password',
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: LinkButton(
                    onPressed: () {},
                    label: 'Forgot password?',
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {
                  SignInModel signInModel = SignInModel(
                      usernameOrEmail: emailController.text,
                      password: passwordController.text);
                  viewModel.signIn(context, signInModel);
                },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AuthFooter(
        isSignIn: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sidelines/viewmodels/sign_up_view_model.dart';

import '../widgets/fields/labeled_text_field.dart';
import '../widgets/footers/auth_footer.dart';
import '../widgets/visuals/sidelines_logo.dart';

class SignUpView extends StatelessWidget {
  final SignUpViewModel viewModel = SignUpViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpView({super.key});

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
                label: 'Your e-mail address',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              LabeledTextField(
                label: 'Enter a password',
                controller: passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              LabeledTextField(
                label: 'Re-enter your password',
                controller: confirmPasswordController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 12.0,
              ),
              FilledButton(
                onPressed: () {
                  viewModel.signUp(context, emailController.text,
                      passwordController.text, confirmPasswordController.text);
                },
                child: const Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AuthFooter(
        isSignIn: false,
      ),
    );
  }
}

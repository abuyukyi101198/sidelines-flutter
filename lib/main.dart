import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/buttons/forgot_password_link_button.dart';
import 'package:sidelines/widgets/buttons/sign_in_button.dart';
import 'package:sidelines/widgets/buttons/sign_in_with_apple_button.dart';
import 'package:sidelines/widgets/buttons/sign_in_with_google_button.dart';
import 'package:sidelines/widgets/fields/email_field.dart';
import 'package:sidelines/widgets/buttons/link_button.dart';
import 'package:sidelines/widgets/fields/password_field.dart';
import 'package:sidelines/widgets/misc/or_divider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Sharp Grotesk',
          primaryColor: ColorPalette.primaryColor,
          scaffoldBackgroundColor: ColorPalette.backgroundColor,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 12),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontFamily: 'Sharp Grotesk', fontSize: 12))),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                  foregroundColor: ColorPalette.backgroundColor,
                  backgroundColor: ColorPalette.primaryColor,
                  textStyle: const TextStyle(
                      fontFamily: 'Sharp Grotesk',
                      fontWeight: FontWeight.w700,
                      fontSize: 12))),
          dividerColor: ColorPalette.textColor),
      home: const SignInScreen(),
    );
  }
}

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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account?', style: TextStyle(color: ColorPalette.textColor),),
          const SizedBox(
            width: 4,
          ),
          LinkButton(onPressed: (){}, label: 'Sign up')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/email_field.dart';
import 'package:sidelines/widgets/link_button.dart';
import 'package:sidelines/widgets/password_field.dart';

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
                      fontFamily: 'Sharp Grotesk', fontSize: 12)))),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/logo.svg',
                  width: 150,
                ),
                const SizedBox(
                  height: 60,
                ),
                const EmailField(),
                const PasswordField(),
                const Align(
                    alignment: Alignment.centerRight,
                    child: LinkButton(label: 'Forgot password?')),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    );
  }
}

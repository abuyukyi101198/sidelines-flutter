import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';
import 'package:sidelines/widgets/visuals/sidelines_logo.dart';

import '../../services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkAutoLogin();
  }

  Future<void> _checkAutoLogin() async {
    final isLoggedIn = await _authService.attemptAutoLogin(context);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed('/matches');
    } else {
      Navigator.of(context).pushReplacementNamed('/sign-in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SidelinesLogo(
            margin: EdgeInsets.only(bottom: 24.0),
            width: 128.0,
            isIcon: true,
          ),
          CircularProgressIndicator(
            backgroundColor: GlobalTheme.colors.secondaryColor,
            color: GlobalTheme.colors.primaryColor,
          ),
          const SizedBox(
            height: 48.0,
          )
        ],
      )),
    );
  }
}

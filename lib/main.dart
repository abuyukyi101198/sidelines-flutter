import 'package:flutter/material.dart';
import 'package:sidelines/screens/matches_screen.dart';
import 'package:sidelines/screens/setup_journey.dart';
import 'package:sidelines/screens/sign_in_screen.dart';
import 'package:sidelines/screens/sign_up_screen.dart';
import 'package:sidelines/utils/color_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Sidelines',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Sharp Grotesk',
            primaryColor: ColorPalette.primaryColor,
            scaffoldBackgroundColor: ColorPalette.backgroundColor,
            appBarTheme: const AppBarTheme(
              color: ColorPalette.backgroundColor,
              foregroundColor: ColorPalette.textColor,
            ),
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
            dividerColor: ColorPalette.textColor,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: ColorPalette.backgroundColor)),
        home: const SignInScreen(),
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/sign-in':
              builder = (BuildContext _) => const SignInScreen();
              break;
            case '/sign-up':
              builder = (BuildContext _) => const SignUpScreen();
              break;
            case '/setup-journey':
              builder = (BuildContext _) => const SetupJourney();
              break;
            case '/matches':
              builder = (BuildContext _) => const MatchesScreen();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => builder(context),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          );
        },
      ),
    );
  }
}

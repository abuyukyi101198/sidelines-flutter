import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/data/theme.dart';
import 'package:sidelines/providers/friends_provider.dart';
import 'package:sidelines/providers/profile_provider.dart';
import 'package:sidelines/views/authentication/sign_up_view.dart';
import 'package:sidelines/views/authentication/splash_screen_view.dart';
import 'package:sidelines/views/friends_view.dart';
import 'package:sidelines/views/profile_view.dart';
import 'package:sidelines/views/setup/setup_journey_view.dart';
import 'package:sidelines/views/authentication/sign_in_view.dart';

import 'deprecated/screens/matches_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FriendsProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
            primaryColor: GlobalTheme.colors.primaryColor,
            scaffoldBackgroundColor: GlobalTheme.colors.backgroundColor,
            appBarTheme: AppBarTheme(
              color: GlobalTheme.colors.backgroundColor,
              foregroundColor: GlobalTheme.colors.textColor,
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
                    foregroundColor: GlobalTheme.colors.backgroundColor,
                    backgroundColor: GlobalTheme.colors.primaryColor,
                    textStyle: const TextStyle(
                        fontFamily: 'Sharp Grotesk',
                        fontWeight: FontWeight.w700,
                        fontSize: 12))),
            dividerColor: GlobalTheme.colors.textColor,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: GlobalTheme.colors.backgroundColor)),
        home: const SplashScreen(),
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/sign-in':
              builder = (BuildContext _) => SignInView();
              break;
            case '/sign-up':
              builder = (BuildContext _) => SignUpView();
              break;
            case '/setup-journey':
              builder = (BuildContext _) => const SetupJourneyView();
              break;
            case '/matches':
              builder = (BuildContext _) => const MatchesScreen();
              break;
            case '/friends':
              builder = (BuildContext _) => const FriendsView();
              break;
            case '/profile':
              builder = (BuildContext _) => const ProfileView();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                builder(context),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          );
        },
      ),
    );
  }
}

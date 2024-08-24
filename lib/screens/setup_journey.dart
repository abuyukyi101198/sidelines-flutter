import 'package:flutter/material.dart';
import 'package:sidelines/data/storage.dart';
import 'package:sidelines/screens/welcome_screen.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/footers/setup_journey_footer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sidelines/screens/username_screen.dart';
import 'package:sidelines/screens/personal_info_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/constants.dart';

class SetupJourney extends StatefulWidget {
  const SetupJourney({super.key});

  @override
  SetupJourneyState createState() => SetupJourneyState();
}

class SetupJourneyState extends State<SetupJourney> {
  final PageController _pageController = PageController();
  final TextEditingController _usernameController = TextEditingController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page?.round() != currentIndex) {
        setState(() {
          currentIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<bool> _checkUsernameValidity(String username) async {
    if (username.isEmpty) {
      return false;
    }
    final token = await Storage().read('token');
    final response = await http.post(
      Uri.parse('${Constants.baseApiUrl}username-unique-check/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token'
      },
      body: jsonEncode({'username': username}),
    );

    return response.statusCode == 200;
  }

  void _goBack() {
    if (_pageController.page != null && _pageController.page!.round() > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() async {
    if (_pageController.page != null && _pageController.page!.round() == 1) {
      bool isUsernameValid = await _checkUsernameValidity(_usernameController.text);
      if (!isUsernameValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a unique username')),
        );
        return;
      }
    }

    if (_pageController.page != null && _pageController.page!.round() < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotColor: ColorPalette.secondaryColor,
            activeDotColor: ColorPalette.primaryColor,
            dotHeight: 7,
            dotWidth: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              const WelcomeScreen(),
              UsernameScreen(usernameController: _usernameController),
              const PersonalInfoScreen(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SetupJourneyFooter(
        index: _pageController.page!.round(),
        onBack: _goBack,
        onNext: _nextPage,
      ),
    );
  }
}

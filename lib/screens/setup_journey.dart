import 'package:flutter/material.dart';
import 'package:sidelines/screens/welcome_screen.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/buttons/next_bottom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sidelines/screens/username_screen.dart';
import 'package:sidelines/screens/personal_info_screen.dart';

class SetupJourney extends StatefulWidget {
  const SetupJourney({super.key});

  @override
  SetupJourneyState createState() => SetupJourneyState();
}

class SetupJourneyState extends State<SetupJourney> {
  final PageController _pageController = PageController();
  bool _isUsernameValid = false;

  void _updateUsernameValidity(bool isValid) {
    setState(() {
      _isUsernameValid = isValid;
    });
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
              UsernameScreen(onUsernameValid: _updateUsernameValidity),
              const PersonalInfoScreen(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NextBottomButton(
        onPressed: _isUsernameValid
            ? () {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
            : null,
      ),
    );
  }
}

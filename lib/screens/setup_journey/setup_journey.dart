import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sidelines/data/storage.dart';
import 'package:sidelines/screens/setup_journey/player_info_screen.dart';
import 'package:sidelines/screens/setup_journey/welcome_screen.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/alerts/notification_bar.dart';
import 'package:sidelines/widgets/footers/setup_journey_footer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sidelines/screens/setup_journey/username_screen.dart';
import 'package:sidelines/screens/setup_journey/personal_info_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/constants.dart';

class SetupJourney extends StatefulWidget {
  const SetupJourney({super.key});

  @override
  SetupJourneyState createState() => SetupJourneyState();
}

class SetupJourneyState extends State<SetupJourney> {
  final PageController _pageController = PageController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final Set<String> _positionController = {};
  final TextEditingController _kitNumberController = TextEditingController();
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateOfBirthController.dispose();
    _positionController.clear();
    _kitNumberController.dispose();
    super.dispose();
  }

  Future<bool> _checkUsernameValidity(String username) async {
    if (username.isEmpty) {
      NotificationBar.show(context, 'Please enter a username');
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

    if (response.statusCode != 200) {
      if (!mounted) return false;
      NotificationBar.show(context, 'Please enter a unique username');
      return false;
    }
    return true;
  }

  Future<bool> _checkPersonalInfoValidity(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController dateOfBirthController) async {
    if (firstNameController.text.isEmpty) {
      NotificationBar.show(context, 'Please enter your name');
      return false;
    } else if (lastNameController.text.isEmpty) {
      NotificationBar.show(context, 'Please enter your last name');
      return false;
    } else if (dateOfBirthController.text.isEmpty) {
      NotificationBar.show(context, 'Please select your date of birth');
      return false;
    }
    return true;
  }

  Future<bool> _checkPlayerInfoValidity(Set<String> positionController,
      TextEditingController kitNumberController) async {
    if (positionController.isEmpty) {
      NotificationBar.show(context, 'Please select at least one position');
      return false;
    } else if (kitNumberController.text.isEmpty) {
      NotificationBar.show(context, 'Please enter a kit number');
      return false;
    }
    return true;
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
    bool isValid = false;
    if (_pageController.page == null) return;
    if (_pageController.page!.round() == 1) {
      isValid = await _checkUsernameValidity(_usernameController.text);
    } else if (_pageController.page!.round() == 2) {
      isValid = await _checkPersonalInfoValidity(
          _firstNameController, _lastNameController, _dateOfBirthController);
    } else if (_pageController.page!.round() == 3) {
      isValid = await _checkPlayerInfoValidity(
          _positionController, _kitNumberController);
    }

    if (isValid && _pageController.page!.round() < 3 ||
        _pageController.page!.round() == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (isValid && _pageController.page!.round() == 3) {
      try {
        final response = await patchProfile(
            _usernameController.text,
            _firstNameController.text,
            _lastNameController.text,
            _dateOfBirthController.text,
            _positionController,
            _kitNumberController.text);

        if (!mounted) return;
        if (response.statusCode == 200) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/matches',
            (Route<dynamic> route) => false,
          );
        } else {
          final Map<String, dynamic> responseData = json.decode(response.body);
          final errorMessage = responseData['detail'] ??
              'Profile setup failed. Please try again.';
          NotificationBar.show(context, errorMessage);
        }
      } catch (e) {
        if (!mounted) return;
        NotificationBar.show(
            context, 'An error occurred. Please try again later.');
      }
    }
  }

  Future<http.Response> patchProfile(
      String username,
      String firstName,
      String lastName,
      String dateOfBirth,
      Set<String> positions,
      String kitNumber) async {
    final token = await Storage().read('token');
    final response = await http.patch(
      Uri.parse('${Constants.baseApiUrl}profile/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token'
      },
      body: jsonEncode({
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth':
            DateFormat('yyyy-MM-dd').format(DateTime.parse(dateOfBirth)),
        'positions': positions.toList(),
        'kit_number': kitNumber
      }),
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SmoothPageIndicator(
          controller: _pageController,
          count: 4,
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
              PersonalInfoScreen(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  dateOfBirthController: _dateOfBirthController),
              PlayerInfoScreen(
                positionController: _positionController,
                kitNumberController: _kitNumberController,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SetupJourneyFooter(
        index: currentIndex,
        onBack: _goBack,
        onNext: _nextPage,
      ),
    );
  }
}

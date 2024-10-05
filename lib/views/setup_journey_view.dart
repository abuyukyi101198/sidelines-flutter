import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart' as clr;
import 'package:sidelines/data/theme.dart';
import 'package:sidelines/models/setup_journey_model.dart';
import 'package:sidelines/views/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../deprecated/screens/setup_journey/personal_info_screen.dart';
import '../deprecated/screens/setup_journey/player_info_screen.dart';
import '../deprecated/screens/setup_journey/username_screen.dart';
import '../exceptions/runtime_exception.dart';
import '../viewmodels/setup_journey_view_model.dart';
import '../widgets/footers/setup_journey_footer.dart';
import '../widgets/notifications/notification_bar.dart';

class SetupJourneyView extends StatefulWidget {
  const SetupJourneyView({super.key});

  @override
  SetupJourneyViewState createState() => SetupJourneyViewState();
}

class SetupJourneyViewState extends State<SetupJourneyView> {
  final SetupJourneyViewModel viewModel = SetupJourneyViewModel();
  final PageController _pageController = PageController();

  File? _profilePictureController;
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
    super.dispose();
  }

  Future<void> goToNextPage() async {
    SetupJourneyModel setupJourneyModel = SetupJourneyModel(
      profilePicture: _profilePictureController,
      username: _usernameController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      dateOfBirth: _dateOfBirthController.text,
      positions: _positionController,
      kitNumber: _kitNumberController.text,
    );
    try {
      await viewModel.validate(
          _pageController.page!.round(), setupJourneyModel);
      if (_pageController.page!.round() < 3 ||
          _pageController.page!.round() == 0) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (_pageController.page!.round() == 3) {
        if (!mounted) return;
        viewModel.patchProfile(context, currentIndex, setupJourneyModel);
      }
    } catch (error) {
      if (!mounted) return;
      if (error is RuntimeException) {
        NotificationBar.show(context, error.messages.first);
      } else {
        NotificationBar.show(context, 'An unexpected error occurred.');
      }
    }
  }

  void goToPreviousPage() {
    if (_pageController.page != null && _pageController.page!.round() > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: clr.Colors.transparent,
        title: SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: ExpandingDotsEffect(
            dotColor: GlobalTheme.colors.secondaryColor,
            activeDotColor: GlobalTheme.colors.primaryColor,
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
              const WelcomeView(),
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
        onBack: goToPreviousPage,
        onNext: goToNextPage,
      ),
    );
  }
}

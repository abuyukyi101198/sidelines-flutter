import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/data/theme.dart';
import 'package:sidelines/providers/friends_provider.dart';
import 'package:sidelines/widgets/displays/profile_header.dart';
import 'package:sidelines/widgets/displays/profile_info_display.dart';
import 'package:sidelines/widgets/displays/profile_performance_chart.dart';
import 'package:sidelines/widgets/displays/profile_statistics_display.dart';
import '../data/storage.dart';
import '../providers/profile_provider.dart';
import '../viewmodels/profile_view_model.dart';
import '../widgets/navigation/screen_navigation_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  late ProfileViewModel profileViewModel;
  late Future<void> _profileFuture;

  @override
  void initState() {
    super.initState();
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    profileViewModel = ProfileViewModel(profileProvider);
    _profileFuture = Future.value();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!profileProvider.profile!.isProfileComplete) {
        setState(() {
          _profileFuture = profileViewModel.fetchProfile();
        });
      }
    });
  }

  Future<void> _refreshProfile() async {
    await profileViewModel.fetchProfile();
    setState(() {
      _profileFuture = Future.value();
    });
  }

  // TODO: Replace with actual logout later on
  Future<void> _logout() async {
    // Clear token from storage
    await Storage().delete('token');

    Provider.of<ProfileProvider>(context, listen: false).clearProfile();
    Provider.of<FriendsProvider>(context, listen: false).clearFriends();

    // Navigate back to the login screen
    Navigator.of(context).pushReplacementNamed('/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: _logout,
              icon: const Icon(Icons.logout_rounded),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: GlobalTheme.colors.secondaryColor,
              color: GlobalTheme.colors.primaryColor,
            ));
          } else if (snapshot.hasError) {
            return Center(
                child: IconButton(
              onPressed: _refreshProfile,
              icon: Icon(
                Icons.refresh_rounded,
                color: GlobalTheme.colors.primaryColor,
                size: 36.0,
              ),
            ));
          }

          return SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RefreshIndicator(
                color: GlobalTheme.colors.primaryColor,
                backgroundColor: GlobalTheme.colors.backgroundColor,
                onRefresh: _refreshProfile,
                child: ListView(
                  children: [
                    ProfileHeader(profileModel: profileProvider.profile!),
                    ProfileInfoDisplay(profileModel: profileProvider.profile!),
                    ProfileStatisticsDisplay(
                        profileModel: profileProvider.profile!),
                    const SizedBox(height: 24.0),
                    const ProfilePerformanceChart(
                      ratings: [6.4, 7.6, 7.2, 8.3, 9.1, 7.1],
                    ),
                  ],
                ),
              ));
        },
      ),
      bottomNavigationBar: const ScreenNavigationBar(currentIndex: 4),
    );
  }
}

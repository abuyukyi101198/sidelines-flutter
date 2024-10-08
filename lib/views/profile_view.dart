import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/data/theme.dart';
import 'package:sidelines/widgets/displays/profile_header.dart';
import 'package:sidelines/widgets/displays/profile_info_display.dart';
import 'package:sidelines/widgets/displays/profile_performance_chart.dart';
import 'package:sidelines/widgets/displays/profile_statistics_display.dart';
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
    await profileViewModel.refreshProfile();
    setState(() {
      _profileFuture = Future.value();
    });
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
              onPressed: () {},
              icon: const Icon(Icons.ios_share),
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

          return RefreshIndicator(
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
          );
        },
      ),
      bottomNavigationBar: const ScreenNavigationBar(currentIndex: 4),
    );
  }
}

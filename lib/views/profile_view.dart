import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../viewmodels/profile_view_model.dart';
import '../deprecated/widgets/display/profile/name_display.dart';
import '../deprecated/widgets/display/profile/performance_chart.dart';
import '../deprecated/widgets/display/profile/profile_display.dart';
import '../deprecated/widgets/display/profile/statistics_display.dart';
import '../deprecated/widgets/display/profile/tag_display.dart';
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
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    profileViewModel = ProfileViewModel(profileProvider);
    _profileFuture = profileProvider.profile!.isProfileComplete
        ? Future.value()
        : profileViewModel.fetchProfile();
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
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return RefreshIndicator(
            onRefresh: _refreshProfile,
            child: ListView(
              children: [
                ProfileDisplay(
                  overallRating: 6.0,
                  profilePictureUrl: profileProvider.profile!.profilePictureUrl,
                ),
                const SizedBox(height: 24.0),
                NameDisplay(
                  firstName: profileProvider.profile!.firstName!,
                  lastName: profileProvider.profile!.lastName!,
                  username: profileProvider.profile!.username!,
                ),
                TagDisplay(
                  positionData: profileProvider.profile!.formatPosition(),
                  numberData: profileProvider.profile!.kitNumber.toString(),
                  playedData: '12',
                  ageData: profileProvider.profile!.calculateAge(),
                  joinData: profileProvider.profile!.formatJoinDate(),
                ),
                StatisticsDisplay(
                  goalsData: profileProvider.profile!.goals!,
                  assistsData: profileProvider.profile!.assists!,
                  mvpData: profileProvider.profile!.mvp!,
                ),
                const SizedBox(height: 24.0),
                const PerformanceChart(
                  ratings: [6.4, 7.6, 7.2, 8.3, 9.1, 8.1],
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
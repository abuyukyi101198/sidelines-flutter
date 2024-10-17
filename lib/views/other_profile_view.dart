import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/models/profile_model.dart';
import 'package:sidelines/widgets/displays/other_profile_action_display.dart';
import 'package:sidelines/widgets/navigation/screen_navigation_bar.dart';

import '../data/theme.dart';
import '../providers/other_profile_provider.dart';
import '../viewmodels/other_profile_view_model.dart';
import '../widgets/displays/profile_header.dart';
import '../widgets/displays/profile_info_display.dart';
import '../widgets/displays/profile_performance_chart.dart';
import '../widgets/displays/profile_statistics_display.dart';

class OtherProfileView extends StatefulWidget {
  final int id;

  const OtherProfileView({required this.id, super.key});

  @override
  OtherProfileViewState createState() => OtherProfileViewState();
}

class OtherProfileViewState extends State<OtherProfileView> {
  late OtherProfileProvider otherProfileProvider;
  late OtherProfileViewModel otherProfileViewModel;
  late Future<ProfileModel> _profileFuture;

  @override
  void initState() {
    super.initState();
    otherProfileProvider =
        Provider.of<OtherProfileProvider>(context, listen: false);
    otherProfileViewModel = OtherProfileViewModel(otherProfileProvider);
    _profileFuture = otherProfileViewModel.fetchProfile(widget.id);
  }

  Future<void> _refreshProfile() async {
    setState(() {
      _profileFuture = otherProfileViewModel.fetchProfile(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: FutureBuilder<ProfileModel>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: GlobalTheme.colors.secondaryColor,
                color: GlobalTheme.colors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: IconButton(
                onPressed: _refreshProfile,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: GlobalTheme.colors.primaryColor,
                  size: 36.0,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            ProfileModel profile = snapshot.data!;

            return SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  ProfileHeader(profileModel: profile),
                  OtherProfileActionDisplay(isConnected: true,),
                  ProfileInfoDisplay(profileModel: profile),
                  ProfileStatisticsDisplay(profileModel: profile),
                  const SizedBox(height: 24.0),
                  const ProfilePerformanceChart(
                    ratings: [6.4, 7.6, 7.2, 8.3, 9.1, 7.1],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                "Profile not found",
                style: TextStyle(
                  color: GlobalTheme.colors.errorColor,
                  fontSize: 18.0,
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const ScreenNavigationBar(
        currentIndex: 3,
      ),
    );
  }
}

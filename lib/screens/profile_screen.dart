import 'package:flutter/material.dart';
import 'package:sidelines/widgets/display/profile/name_display.dart';
import 'package:sidelines/widgets/display/profile/performance_chart.dart';
import 'package:sidelines/widgets/display/profile/profile_display.dart';
import 'package:sidelines/widgets/display/profile/statistics_display.dart';
import 'package:sidelines/widgets/display/profile/tag_display.dart';
import 'package:sidelines/widgets/misc/navigation_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileDisplay(overallRating: 7),
          SizedBox(
            height: 24.0,
          ),
          NameDisplay(
            firstName: 'firstName',
            lastName: 'lastName',
            username: 'username',
          ),
          TagDisplay(
            positionData: 'CM',
            numberData: '6',
            playedData: '12',
            ageData: '23',
            joinData: 'September 23rd, 2024',
          ),
          StatisticsDisplay(goalsData: 23, assistsData: 36, mvpData: 7),
          SizedBox(
            height: 24.0,
          ),
          PerformanceChart(ratings: [6.4, 7.6, 7.2, 8.3, 9.1, 8.1]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          NavigationItem(iconPath: 'assets/icons/matches.svg'),
          NavigationItem(iconPath: 'assets/icons/teams.svg'),
          NavigationItem(iconPath: 'assets/icons/arrange.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
        ],
      ),
    );
  }
}

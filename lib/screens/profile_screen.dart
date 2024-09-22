import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/widgets/navigation/screen_navigation_bar.dart';

import '../data/constants.dart';
import '../data/storage.dart';
import '../providers/profile_provider.dart';
import '../widgets/alerts/notification_bar.dart';
import '../widgets/display/profile/name_display.dart';
import '../widgets/display/profile/performance_chart.dart';
import '../widgets/display/profile/profile_display.dart';
import '../widgets/display/profile/statistics_display.dart';
import '../widgets/display/profile/tag_display.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

// TODO: Implement performance
class ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? profileData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  String? _formatPosition(List<dynamic> positionsData) {
    Iterable<String?> positions =
        positionsData.map((value) => value?.toString());
    const Map<String, String> positionCategories = {
      'ST': 'Striker',
      'LW': 'Winger',
      'RW': 'Winger',
      'CM': 'Midfielder',
      'LB': 'Defender',
      'CB': 'Defender',
      'RB': 'Defender',
      'GK': 'Goalkeeper',
    };
    if (positions.contains('GK')) {
      return 'Goalkeeper';
    }
    Set<String?> categories =
        positions.map((pos) => positionCategories[pos] ?? pos).toSet();
    if (categories.length > 1) {
      return 'Versatile';
    }
    return categories.isNotEmpty ? categories.first : 'N/A';
  }

  String _formatJoinDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat("MMMM d").format(parsedDate);
    int day = parsedDate.day;

    String daySuffix;
    if (day % 10 == 1 && day != 11) {
      daySuffix = 'st';
    } else if (day % 10 == 2 && day != 12) {
      daySuffix = 'nd';
    } else if (day % 10 == 3 && day != 13) {
      daySuffix = 'rd';
    } else {
      daySuffix = 'th';
    }

    return "$formattedDate$daySuffix, ${parsedDate.year}";
  }

  String _calculateAge(String? dateOfBirth) {
    if (dateOfBirth == null) return 'N/A';
    final dob = DateTime.parse(dateOfBirth);
    final today = DateTime.now();
    final age = today.year - dob.year;
    return age.toString();
  }

  Future<http.Response?> fetchProfile() async {
    try {
      final token = await Storage().read('token');
      final response = await http.get(
        Uri.parse('${Constants.baseApiUrl}profile/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (!mounted) return null;
      if (response.statusCode == 200) {
        final profileData = json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          this.profileData = profileData;
          isLoading = false;
        });

        final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
        profileProvider.setProfilePictureUrl(profileData['profile_picture']);
      } else {
        setState(() {
          isLoading = false;
        });
        final Map<String, dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));
        final errorMessage = responseData['detail'] ??
            'Could not fetch profile. Please try again.';
        NotificationBar.show(context, errorMessage);
      }
    } catch (e) {
      if (!mounted) return null;
      NotificationBar.show(
          context, 'An error occurred. Please try again later.');
    }
    return null;
  }

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : profileData != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileDisplay(
                      overallRating: profileData!['overall_rating'],
                      profilePictureUrl: profileData!['profile_picture'],
                    ),
                    const SizedBox(height: 24.0),
                    NameDisplay(
                      firstName: profileData!['first_name'],
                      lastName: profileData!['last_name'],
                      username: profileData!['username'],
                    ),
                    TagDisplay(
                      positionData: _formatPosition(profileData!['positions'])!,
                      numberData: profileData!['kit_number'].toString(),
                      playedData: '12',
                      ageData: _calculateAge(profileData!['date_of_birth']),
                      joinData: _formatJoinDate(profileData!['join_date']),
                    ),
                    StatisticsDisplay(
                      goalsData: profileData!['goals'],
                      assistsData: profileData!['assists'],
                      mvpData: profileData!['mvp'],
                    ),
                    const SizedBox(height: 24.0),
                    const PerformanceChart(
                        ratings: [6.4, 7.6, 7.2, 8.3, 9.1, 8.1]),
                  ],
                )
              : const Center(child: Text('No profile data available')),
      bottomNavigationBar: const ScreenNavigationBar(
        currentIndex: 4,
      ),
    );
  }
}

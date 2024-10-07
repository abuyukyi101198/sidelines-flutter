import 'package:intl/intl.dart';

class ProfileModel {
  final double? overallRating;
  final String? profilePictureUrl;
  final String? firstName;
  final String? lastName;
  final String? username;
  final List<String>? positions;
  final String? joinDate;
  final String? dateOfBirth;
  final int? kitNumber;
  final int? goals;
  final int? assists;
  final int? mvp;

  ProfileModel({
    this.overallRating,
    this.profilePictureUrl,
    this.firstName,
    this.lastName,
    this.username,
    this.positions,
    this.joinDate,
    this.dateOfBirth,
    this.kitNumber,
    this.goals,
    this.assists,
    this.mvp,
  });

  bool get isProfileComplete {
    return overallRating != null &&
        profilePictureUrl != null &&
        firstName != null &&
        lastName != null &&
        username != null &&
        positions != null &&
        joinDate != null &&
        dateOfBirth != null &&
        kitNumber != null &&
        goals != null &&
        assists != null &&
        mvp != null;
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      overallRating: json['overall_rating'] as double?,
      profilePictureUrl: json['profile_picture'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      username: json['username'] as String?,
      positions: json['positions'] != null
          ? List<String>.from(json['positions'])
          : null,
      joinDate: json['join_date'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      kitNumber: json['kit_number'] as int?,
      goals: json['goals'] as int?,
      assists: json['assists'] as int?,
      mvp: json['mvp'] as int?,
    );
  }

  String formatPosition() {
    if (positions == null) {
      return 'N/A';
    }

    const positionCategories = {
      'ST': 'Striker',
      'LW': 'Winger',
      'RW': 'Winger',
      'CM': 'Midfielder',
      'LB': 'Defender',
      'CB': 'Defender',
      'RB': 'Defender',
      'GK': 'Goalkeeper',
    };

    if (positions!.contains('GK')) {
      return 'Goalkeeper';
    }

    Set<String?>? categories = positions
        ?.map((pos) => positionCategories[pos] ?? pos)
        .cast<String?>()
        .toSet();
    return categories!.length > 1 ? 'Versatile' : categories.first ?? 'N/A';
  }

  String formatJoinDate() {
    if (joinDate == null) return 'N/A';
    DateTime parsedDate = DateTime.parse(joinDate!);
    String formattedDate = DateFormat("MMMM d").format(parsedDate);
    int day = parsedDate.day;
    String daySuffix = _getDaySuffix(day);

    return "$formattedDate$daySuffix, ${parsedDate.year}";
  }

  String calculateAge() {
    if (dateOfBirth == null) return 'N/A';
    final dob = DateTime.parse(dateOfBirth!);
    final today = DateTime.now();
    return (today.year - dob.year).toString();
  }

  String _getDaySuffix(int day) {
    if (day % 10 == 1 && day != 11) return 'st';
    if (day % 10 == 2 && day != 12) return 'nd';
    if (day % 10 == 3 && day != 13) return 'rd';
    return 'th';
  }
}

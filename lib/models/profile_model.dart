import 'package:intl/intl.dart';

class ProfileModel {
  //region variables
  int? _id;
  double? _overallRating;
  String? _profilePictureUrl;
  String? _firstName;
  String? _lastName;
  String? _username;
  List<String>? _positions;
  String? _joinDate;
  String? _dateOfBirth;
  int? _kitNumber;
  int? _goals;
  int? _assists;
  int? _mvp;
  //endregion

  //region getters
  int? get id => _id;
  double? get overallRating => _overallRating;
  String? get profilePictureUrl => _profilePictureUrl;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  List<String>? get positions => _positions;
  String? get joinDate => _joinDate;
  String? get dateOfBirth => _dateOfBirth;
  int? get kitNumber => _kitNumber;
  int? get goals => _goals;
  int? get assists => _assists;
  int? get mvp => _mvp;
  String get formattedPosition {
    if (_positions == null || _positions!.isEmpty) return 'N/A';
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

    Set<String?> categories = _positions
        ?.map((pos) => positionCategories[pos] ?? pos)
        .toSet() ?? {};

    return categories.contains('GK')
        ? 'Goalkeeper'
        : (categories.length > 1 ? 'Versatile' : categories.first ?? 'N/A');
  }
  String get formattedJoinDate {
    if (_joinDate == null) return 'N/A';
    DateTime parsedDate = DateTime.parse(_joinDate!);
    String formattedDate = DateFormat("MMMM d").format(parsedDate);
    int day = parsedDate.day;
    return "$formattedDate${_getDaySuffix(day)}, ${parsedDate.year}";
  }
  String get age {
    if (_dateOfBirth == null) return 'N/A';
    final dob = DateTime.parse(_dateOfBirth!);
    final today = DateTime.now();
    return (today.year - dob.year).toString();
  }
  bool get isProfileComplete {
    return _overallRating != null &&
        _profilePictureUrl != null &&
        _firstName != null &&
        _lastName != null &&
        _username != null &&
        _positions != null &&
        _joinDate != null &&
        _dateOfBirth != null &&
        _kitNumber != null &&
        _goals != null &&
        _assists != null &&
        _mvp != null;
  }
  //endregion

  ProfileModel({
    int? id,
    double? overallRating,
    String? profilePictureUrl,
    String? firstName,
    String? lastName,
    String? username,
    List<String>? positions,
    String? joinDate,
    String? dateOfBirth,
    int? kitNumber,
    int? goals,
    int? assists,
    int? mvp,
  }) {
    _id = id;
    _overallRating = overallRating;
    _profilePictureUrl = profilePictureUrl;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _positions = positions;
    _joinDate = joinDate;
    _dateOfBirth = dateOfBirth;
    _kitNumber = kitNumber;
    _goals = goals;
    _assists = assists;
    _mvp = mvp;
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int?,
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

  //region helpers
  String _getDaySuffix(int day) {
    if (day % 10 == 1 && day != 11) return 'st';
    if (day % 10 == 2 && day != 12) return 'nd';
    if (day % 10 == 3 && day != 13) return 'rd';
    return 'th';
  }
//endregion
}
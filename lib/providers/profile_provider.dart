import 'package:flutter/material.dart';

import '../models/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel? _currentProfile;
  ProfileModel? _viewedProfile;

  ProfileModel? get currentProfile => _currentProfile;
  ProfileModel? get viewedProfile => _viewedProfile;

  void setCurrentProfile(ProfileModel profile) {
    _currentProfile = profile;
    notifyListeners();
  }

  void setViewedProfile(ProfileModel profile) {
    _viewedProfile = profile;
    notifyListeners();
  }

  void setProfilePictureUrl(String url) {
    _currentProfile = ProfileModel(
      overallRating: _currentProfile?.overallRating,
      profilePictureUrl: url,
      firstName: _currentProfile?.firstName,
      lastName: _currentProfile?.lastName,
      username: _currentProfile?.username,
      positions: _currentProfile?.positions,
      kitNumber: _currentProfile?.kitNumber,
      goals: _currentProfile?.goals,
      assists: _currentProfile?.assists,
      mvp: _currentProfile?.mvp,
      dateOfBirth: _currentProfile?.dateOfBirth,
      joinDate: _currentProfile?.joinDate,
    );
    notifyListeners();
  }

  void clearProfile() {
    _currentProfile = null;
    _viewedProfile = null;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../models/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel? _profile;

  ProfileModel? get profile => _profile;

  void setProfile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }

  void setProfilePictureUrl(String url) {
    _profile = ProfileModel(
      overallRating: _profile?.overallRating,
      profilePictureUrl: url,
      firstName: _profile?.firstName,
      lastName: _profile?.lastName,
      username: _profile?.username,
      positions: _profile?.positions,
      kitNumber: _profile?.kitNumber,
      goals: _profile?.goals,
      assists: _profile?.assists,
      mvp: _profile?.mvp,
      dateOfBirth: _profile?.dateOfBirth,
      joinDate: _profile?.joinDate,
    );
    notifyListeners();
  }

  void clearProfile() {
    _profile = null;
    notifyListeners();
  }
}

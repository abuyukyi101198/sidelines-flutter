import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/constants.dart';
import '../data/storage.dart';
import '../models/profile_model.dart';
import '../providers/profile_provider.dart';

class ProfileViewModel {
  final ProfileProvider _profileProvider;

  ProfileViewModel(this._profileProvider);

  Future<void> fetchProfile() async {
    try {
      final token = await Storage().read('token');
      final response = await http.get(
        Uri.parse('${Constants.baseApiUrl}profile/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        ProfileModel profile = ProfileModel.fromJson(data);
        _profileProvider.setProfile(profile);
      } else {
        // Handle error
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> refreshProfile() async {
    await fetchProfile();
  }
}
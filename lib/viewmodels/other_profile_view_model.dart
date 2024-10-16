import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidelines/exceptions/api_exception.dart';
import '../data/constants.dart';
import '../data/storage.dart';
import '../models/profile_model.dart';
import '../providers/other_profile_provider.dart';

class OtherProfileViewModel {
  final OtherProfileProvider _profileProvider;

  OtherProfileViewModel(this._profileProvider);

  Future<ProfileModel> fetchProfile(int id) async {
    if (_profileProvider.isProfileCached(id)) {
      return _profileProvider.getCachedProfile(id)!;
    }

    try {
      final token = await Storage().read('token');
      final response = await http.get(
        Uri.parse('${Constants.baseApiUrl}profile/$id/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));

        ProfileModel profile = ProfileModel.fromJson(data);

        _profileProvider.cacheProfile(id, profile);
        return profile;
      } else {
        throw ApiException(response);
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
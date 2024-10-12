import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/constants.dart';
import '../data/storage.dart';
import '../exceptions/api_exception.dart';
import '../models/profile_model.dart';
import '../providers/friends_provider.dart';

class FriendsViewModel {
  final FriendsProvider _friendsProvider;

  FriendsViewModel(this._friendsProvider);

  Future<void> fetchFriends() async {
    try {
      final token = await Storage().read('token');
      final response = await http.get(
        Uri.parse('${Constants.baseApiUrl}profile/friends/'),
        headers: {'Authorization': 'Token $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data =
            json.decode(utf8.decode(response.bodyBytes))['friends'];

        List<ProfileModel> friends = data
            .map((json) => ProfileModel.fromJson(json))
            .toList();

        _friendsProvider.setFriends(friends);
      } else {
        throw ApiException(response);
      }
    } catch (error) {
      rethrow;
    }
  }
}

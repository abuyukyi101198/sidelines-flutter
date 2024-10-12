import 'package:flutter/foundation.dart';
import '../models/profile_model.dart';

class FriendsProvider with ChangeNotifier {
  List<ProfileModel> _friends = [];
  List<ProfileModel> _searchResults = [];

  List<ProfileModel> get friends => _friends;
  List<ProfileModel> get searchResults => _searchResults;

  void setFriends(List<ProfileModel> friends) {
    _friends = friends;
    notifyListeners();
  }

  void setSearchResults(List<ProfileModel> results) {
    _searchResults = results;
    notifyListeners();
  }

  void clearFriends() {
    _friends = [];
    notifyListeners();
  }
}
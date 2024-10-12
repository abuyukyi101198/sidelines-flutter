import 'package:flutter/foundation.dart';
import '../models/profile_model.dart';

class FriendsProvider with ChangeNotifier {
  List<ProfileModel> _friends = [];

  List<ProfileModel> get friends => _friends;

  void setFriends(List<ProfileModel> friends) {
    _friends = friends;
    notifyListeners();
  }
}
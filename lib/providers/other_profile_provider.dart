import 'package:flutter/foundation.dart';
import 'package:sidelines/models/profile_model.dart';

class OtherProfileProvider with ChangeNotifier {
  static const int _cacheLimit = 10;
  final Map<int, ProfileModel> _cachedProfiles = {};
  final List<int> _cacheOrder = [];

  bool isProfileCached(int id) {
    return _cachedProfiles.containsKey(id);
  }

  ProfileModel? getCachedProfile(int id) {
    if (isProfileCached(id)) {
      _cacheOrder.remove(id);
      _cacheOrder.add(id);
      return _cachedProfiles[id];
    }
    return null;
  }

  void cacheProfile(int id, ProfileModel profile) {
    if (_cachedProfiles.length >= _cacheLimit) {
      int oldestUserId = _cacheOrder.removeAt(0);
      _cachedProfiles.remove(oldestUserId);
    }
    _cachedProfiles[id] = profile;

    if (_cacheOrder.contains(id)) {
      _cacheOrder.remove(id);
    }

    _cacheOrder.add(id);
    notifyListeners();
  }

  void clearCache() {
    _cachedProfiles.clear();
    _cacheOrder.clear();
    notifyListeners();
  }
}
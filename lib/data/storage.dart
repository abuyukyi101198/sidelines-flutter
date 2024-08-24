import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  Storage._privateConstructor();
  static final Storage _instance = Storage._privateConstructor();

  factory Storage() {
    return _instance;
  }

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<bool> containsKey(String key) async {
    return await _secureStorage.containsKey(key: key);
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}

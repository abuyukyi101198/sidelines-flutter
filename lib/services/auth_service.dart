import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../data/constants.dart';
import '../data/storage.dart';
import '../providers/profile_provider.dart';

class AuthService {
  final Storage storage = Storage();

  Future<bool> attemptAutoLogin(BuildContext context) async {
    final token = await storage.read('token');

    if (token == null) {
      return false;
    }

    final response = await http.get(
      Uri.parse('${Constants.baseApiUrl}verify-token/'),
      headers: {'Authorization': 'Token $token'},
    );

    if (response.statusCode == 200) {
      if (!context.mounted) return false;
      final data = jsonDecode(response.body);
      final profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);

      profileProvider.setProfilePictureUrl(data['profile']['profile_picture']);

      return true;
    } else {
      await storage.delete('token');
      return false;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sidelines/exceptions/validation_exception.dart';

import '../data/constants.dart';
import '../data/storage.dart';

class SetupJourneyModel {
  final File? profilePicture;
  final String username;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final Set<String> positions;
  final String kitNumber;

  SetupJourneyModel({
    required this.profilePicture,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.positions,
    required this.kitNumber,
  });

  Future<void> validate(int currentPage) async {
    if (currentPage == 0) {
      return;
    } else if (currentPage == 1) {
      await _validateProfilePictureAndUsername();
    } else if (currentPage == 2) {
      _validatePersonalInfo();
    } else {
      _validatePlayerInfo();
    }
  }

  Future<void> _validateProfilePictureAndUsername() async {
    List<String> errors = [];

    if (username.isEmpty) {
      errors.add('Please enter a username.');
    } else {
      final String? token = await Storage().read('token');
      final response = await http.post(
        Uri.parse('${Constants.baseApiUrl}username-unique-check/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode({'username': username}),
      );

      if (response.statusCode != 200) {
        errors.add('Username already taken, please choose another.');
      }
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors);
    }
  }

  void _validatePersonalInfo() {
    List<String> errors = [];

    if (firstName.isEmpty) {
      errors.add('Please enter your first name.');
    }
    if (lastName.isEmpty) {
      errors.add('Please enter your last name.');
    }
    if (dateOfBirth.isEmpty) {
      errors.add('Please select your date of birth.');
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors);
    }
  }

  void _validatePlayerInfo() {
    List<String> errors = [];

    if (positions.isEmpty) {
      errors.add('Please select at least one position.');
    }
    if (kitNumber.isEmpty) {
      errors.add('Please enter a kit number.');
    }

    if (errors.isNotEmpty) {
      throw ValidationException(errors);
    }
  }
}

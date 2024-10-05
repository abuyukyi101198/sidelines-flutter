import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sidelines/data/storage.dart';
import 'package:sidelines/exceptions/api_exception.dart';
import 'package:sidelines/models/setup_journey_model.dart';

import '../data/constants.dart';
import '../exceptions/runtime_exception.dart';
import '../widgets/notifications/notification_bar.dart';

class SetupJourneyViewModel extends ChangeNotifier {
  final Storage storage = Storage();

  http.Response? response;

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> validate(
      int currentIndex, SetupJourneyModel setupJourneyModel) async {
    await setupJourneyModel.validate(currentIndex);
  }

  Future<void> patchProfile(BuildContext context, int currentIndex,
      SetupJourneyModel setupJourneyModel) async {
    isLoading.value = true;

    try {
      setupJourneyModel.validate(currentIndex);

      final token = await storage.read('token');
      var request = http.MultipartRequest(
          'PATCH', Uri.parse('${Constants.baseApiUrl}profile/'));
      request.headers['Authorization'] = 'Token $token';

      request.fields['username'] = setupJourneyModel.username;
      request.fields['first_name'] = setupJourneyModel.firstName;
      request.fields['last_name'] = setupJourneyModel.lastName;
      request.fields['date_of_birth'] = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(setupJourneyModel.dateOfBirth));
      request.fields['positions'] =
          jsonEncode(setupJourneyModel.positions.toList());
      request.fields['kit_number'] = setupJourneyModel.kitNumber.toString();

      final profilePicture = setupJourneyModel.profilePicture;
      if (profilePicture != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'profile_picture',
          profilePicture.path,
          filename: basename(profilePicture.path),
        ));
      }

      var response = await request.send();

      if (!context.mounted) return;
      if (response.statusCode == 200) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/matches',
          (Route<dynamic> route) => false,
        );
      } else {
        throw ApiException(response);
      }
    } catch (error) {
      if (!context.mounted) return;
      if (error is RuntimeException) {
        NotificationBar.show(context, error.messages.first);
      } else {
        NotificationBar.show(context, 'An unexpected error occurred.');
      }
    } finally {
      isLoading.value = false;
    }
  }
}

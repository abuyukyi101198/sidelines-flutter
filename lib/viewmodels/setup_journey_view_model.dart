import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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
      final response = await http.patch(
        Uri.parse('${Constants.baseApiUrl}profile/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode({
          'username': setupJourneyModel.username,
          'first_name': setupJourneyModel.firstName,
          'last_name': setupJourneyModel.lastName,
          'date_of_birth': DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(setupJourneyModel.dateOfBirth)),
          'positions': setupJourneyModel.positions.toList(),
          'kit_number': setupJourneyModel.kitNumber
        }),
      );

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

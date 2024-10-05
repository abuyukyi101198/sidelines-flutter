import 'dart:convert';

import 'package:sidelines/exceptions/runtime_exception.dart';

class ApiException extends RuntimeException {
  final dynamic response;
  List<String> _messages = ['Something went wrong. Please try again.'];

  ApiException(this.response) {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData.isNotEmpty) {
      List<String> errorMessages = [];

      responseData.forEach((key, value) {
        if (value is List) {
          errorMessages.addAll(value.map((error) => "$error").toList());
        } else {
          errorMessages.add("$value");
        }
      });

      if (errorMessages.isNotEmpty) {
        _messages = errorMessages;
      }
    }
  }

  @override
  List<String> get messages => _messages;
}
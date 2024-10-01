import 'dart:convert';

class ApiException implements Exception {
  final dynamic response;
  String _message = 'Something went wrong. Please try again.';

  ApiException(this.response) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (responseData.isNotEmpty) {
      _message = responseData['error'].toString();
    }
  }

  @override
  String toString() {
    return _message;
  }
}
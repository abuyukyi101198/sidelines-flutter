import 'package:sidelines/exceptions/runtime_exception.dart';

class ValidationException extends RuntimeException {
  final List<String> _messages;

  ValidationException(this._messages);

  @override
  List<String> get messages => _messages;
}
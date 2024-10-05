import 'package:sidelines/exceptions/runtime_exception.dart';

class ValidationException extends RuntimeException {
  final List<String> _messages;

  ValidationException(List<String> messages) : _messages = messages;

  ValidationException.single(String message) : _messages = [message];

  @override
  List<String> get messages => _messages;
}
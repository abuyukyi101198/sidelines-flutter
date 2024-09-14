import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class PasswordField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final String? reenterPassword;

  final String _defaultLabel = 'Password';

  const PasswordField(
      {super.key, this.label, this.controller, this.reenterPassword});

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (reenterPassword != null && value != reenterPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = label ?? _defaultLabel;
    return TextFieldWithLabel(
      label: effectiveLabel,
      controller: controller,
      textInputType: TextInputType.visiblePassword,
      validator: _validatePassword,
    );
  }
}

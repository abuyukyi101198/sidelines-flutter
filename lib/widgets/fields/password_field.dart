import 'package:flutter/material.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class PasswordField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validateConfirmPassword;

  const PasswordField({
    super.key,
    this.label,
    this.controller,
    this.validateConfirmPassword,
  });

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (widget.validateConfirmPassword != null) {
      return widget.validateConfirmPassword!(value);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = widget.label ?? 'Password';
    return TextFieldWithLabel(
      label: effectiveLabel,
      controller: widget.controller,
      textInputType: TextInputType.visiblePassword,
      validator: _validatePassword,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class EmailField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;

  final String _defaultLabel = 'E-mail';

  const EmailField({
    super.key,
    this.label,
    this.controller,
  });

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = label ?? _defaultLabel;
    return TextFieldWithLabel(
      label: effectiveLabel,
      controller: controller,
      textInputType: TextInputType.emailAddress,
      validator: _validateEmail,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class UsernameField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;

  final String _defaultLabel = 'Username';

  const UsernameField({
    super.key,
    this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = label ?? _defaultLabel;
    return TextFieldWithLabel(
      label: effectiveLabel,
      controller: controller,
      textInputType: TextInputType.text
    );
  }
}

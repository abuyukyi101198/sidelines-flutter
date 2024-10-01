import 'package:flutter/cupertino.dart';
import 'package:sidelines/deprecated/widgets/fields/text_field_with_label.dart';

class UsernameField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  final String _defaultLabel = 'Username';

  const UsernameField({
    super.key,
    this.label,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = label ?? _defaultLabel;
    return TextFieldWithLabel(
      label: effectiveLabel,
      controller: controller,
      textInputType: TextInputType.text,
      onChanged: onChanged,
    );
  }
}

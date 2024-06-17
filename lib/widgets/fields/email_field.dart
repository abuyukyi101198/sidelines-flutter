import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class EmailField extends StatelessWidget {
  final String? label;

  final String _defaultLabel = 'E-mail';

  const EmailField({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final String effectiveLabel = label ?? _defaultLabel;
    return TextFieldWithLabel(
      label: effectiveLabel,
      textInputType: TextInputType.emailAddress,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextFieldWithLabel(
      label: 'Password',
      textInputType: TextInputType.visiblePassword,
    );
  }
}

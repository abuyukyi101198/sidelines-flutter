import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/fields/text_field_with_label.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextFieldWithLabel(
      label: 'E-mail',
      textInputType: TextInputType.emailAddress,
    );
  }
}

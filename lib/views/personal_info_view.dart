import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';
import '../../widgets/fields/date_field.dart';
import '../widgets/fields/labeled_text_field.dart';

class PersonalInfoView extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController dateOfBirthController;

  const PersonalInfoView({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.dateOfBirthController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 90,
                ),
                Text(
                  'Personal Information',
                  style: TextStyle(
                    color: GlobalTheme.colors.textColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'In addition to your full name, a date of birth will help find friends and arrange matches within your age bracket.',
                  style: TextStyle(
                    color: GlobalTheme.colors.textColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                LabeledTextField(
                  label: 'First name',
                  controller: firstNameController,
                  textInputType: TextInputType.name,
                ),
                LabeledTextField(
                  label: 'Last name',
                  controller: lastNameController,
                  textInputType: TextInputType.name,
                ),
                DateField(
                  label: 'Date of birth',
                  controller: dateOfBirthController,
                ),
              ]),
        ),
      ),
    );
  }
}

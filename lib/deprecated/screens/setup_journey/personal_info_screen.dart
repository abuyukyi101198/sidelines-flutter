import 'package:flutter/material.dart';

import '../../widgets/fields/date_field.dart';
import '../../widgets/fields/name_field.dart';


class PersonalInfoScreen extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController dateOfBirthController;

  const PersonalInfoScreen({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.dateOfBirthController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'In addition to your full name, a date of birth will help find friends and arrange matches within your age bracket.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                NameField(
                  controller: firstNameController,
                ),
                NameField(
                  label: 'Last name',
                  controller: lastNameController,
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

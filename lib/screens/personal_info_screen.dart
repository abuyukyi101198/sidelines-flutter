import 'package:flutter/material.dart';
import 'package:sidelines/widgets/fields/date_field.dart';
import 'package:sidelines/widgets/fields/name_field.dart';


class PersonalInfoScreen extends StatelessWidget {
  final TextEditingController dateController;

  const PersonalInfoScreen({super.key, required this.dateController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Personal Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'In addition to your full name, a date of birth and city of residence will help find friends and arrange matches within your age bracket, in your vicinity.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                NameField(),
                NameField(
                  label: 'Last name',
                ),
                DateField(
                  dateController: dateController,
                ),
              ]),
        ),
      ),
    );
  }
}

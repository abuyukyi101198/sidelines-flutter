import 'package:flutter/material.dart';

import '../../widgets/fields/username_field.dart';

class UsernameScreen extends StatelessWidget {
  final TextEditingController usernameController;

  const UsernameScreen({super.key, required this.usernameController});

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
                'Choose a username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Having a username will help your friends to find your profile.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 36),
              UsernameField(
                controller: usernameController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sidelines/widgets/fields/username_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/constants.dart';

class UsernameScreen extends StatefulWidget {
  final Function(bool) onUsernameValid; // Callback for username validity

  const UsernameScreen({super.key, required this.onUsernameValid});

  @override
  UsernameScreenState createState() => UsernameScreenState();
}

class UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _checkUsername(String username) async {
    if (username.isEmpty) {
      widget.onUsernameValid(false); // Username is not valid
      return;
    }

    final response = await http.post(
      Uri.parse('${Constants.baseApiUrl}username-unique-check/'), // Replace with your API endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );

    setState(() {
      if (response.statusCode == 200) {
        widget.onUsernameValid(true); // Username is unique
      } else {
        widget.onUsernameValid(false); // Username is not unique or invalid
      }
    });
  }

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
                controller: _usernameController,
                onChanged: (username) {
                  _checkUsername(username);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

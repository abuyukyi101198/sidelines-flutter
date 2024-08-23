import 'package:flutter/material.dart';
import 'package:sidelines/widgets/buttons/next_bottom_button.dart';
import 'package:sidelines/widgets/fields/username_field.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Choose a username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Having a username will help your friends to find your profile.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                UsernameField(),
              ]),
        ),
      ),
      bottomNavigationBar: NextBottomButton(),
    );
  }
}

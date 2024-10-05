import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sidelines/data/theme.dart';
import '../widgets/fields/labeled_text_field.dart';

class ProfilePictureAndUsernameView extends StatefulWidget {
  final TextEditingController usernameController;
  final File? currentProfilePicture;
  final Function(File?) onProfilePictureSelected;

  const ProfilePictureAndUsernameView({
    super.key,
    required this.usernameController,
    required this.currentProfilePicture,
    required this.onProfilePictureSelected,
  });


  @override
  ProfilePictureAndUsernameViewState createState() =>
      ProfilePictureAndUsernameViewState();
}

class ProfilePictureAndUsernameViewState
    extends State<ProfilePictureAndUsernameView> {
  File? _profilePicture;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _profilePicture = widget.currentProfilePicture;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePicture = File(pickedFile.path);
      });
      widget.onProfilePictureSelected(_profilePicture);
    }
  }

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
                'Choose a username',
                style: TextStyle(
                  color: GlobalTheme.colors.textColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Having a username will help your friends to find your profile.',
                style: TextStyle(
                  color: GlobalTheme.colors.textColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 36),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: GlobalTheme.colors.secondaryColor,
                  backgroundImage: _profilePicture != null
                      ? FileImage(_profilePicture!)
                      : null,
                  child: _profilePicture == null
                      ? Icon(
                          Icons.image,
                          size: 48,
                          color: GlobalTheme.colors.backgroundColor,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Profile Picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: GlobalTheme.colors.textColor, fontSize: 12),
              ),
              const SizedBox(height: 24),
              LabeledTextField(
                label: 'Username/E-mail',
                controller: widget.usernameController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sidelines/widgets/badges/rating_badge.dart';
import '../../../data/constants.dart';
import '../../../data/storage.dart';
import '../../../utils/color_palette.dart';
import '../../alerts/notification_bar.dart';

class ProfileDisplay extends StatefulWidget {
  final double overallRating;
  final String? profilePictureUrl;

  const ProfileDisplay({
    super.key,
    required this.overallRating,
    this.profilePictureUrl,
  });

  @override
  State<ProfileDisplay> createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  File? _image;
  String? _currentProfilePictureUrl;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _currentProfilePictureUrl = widget.profilePictureUrl;
  }

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      if (!context.mounted) return;
      _uploadProfilePicture(context, _image);
    }
  }

  Future<void> _uploadProfilePicture(BuildContext context, File? imageFile) async {
    if (imageFile != null) {
      try {
        String apiUrl =
            '${Constants.baseApiUrl}upload-profile-picture/';
        final token = await Storage().read('token');
        var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
        request.headers['Authorization'] = 'Token $token';

        request.files.add(await http.MultipartFile.fromPath(
          'profile_picture',
          imageFile.path,
          filename: basename(imageFile.path),
        ));

        var response = await request.send();

        if (response.statusCode == 200) {
          String responseString = await response.stream.bytesToString();
          String newUrl = json.decode(responseString)['profile_picture_url'];

          setState(() {
            _currentProfilePictureUrl = newUrl;
          });
          if (!context.mounted) return;
          NotificationBar.show(
              context, 'Profile picture uploaded successfully!');
        } else {
          if (!context.mounted) return;
          NotificationBar.show(
              context, 'Could not upload profile picture. Please try again.');
        }
      } catch (e) {
        if (!context.mounted) return;
        NotificationBar.show(
            context, 'An error occurred. Please try again later.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              _pickImage(context);
            },
            child: CircleAvatar(
              radius: 48,
              backgroundColor: ColorPalette.secondaryColor,
              backgroundImage: _currentProfilePictureUrl != null
                  ? NetworkImage(_currentProfilePictureUrl!)
                  : _image != null
                      ? FileImage(_image!)
                          as ImageProvider
                      : null,
            ),
          ),
          Positioned(
            bottom: -5,
            left: 210,
            child: RatingBadge(
              overallRating: widget.overallRating,
            ),
          ),
        ],
      ),
    );
  }
}

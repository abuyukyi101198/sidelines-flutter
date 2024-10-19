import 'package:flutter/material.dart';
import 'package:sidelines/models/profile_model.dart';
import '../../data/theme.dart';

class OtherProfileActionDisplay extends StatefulWidget {
  final ProfileModel profileModel;
  final Future<void> Function() sendRequest;
  final Future<void> Function() unfriend;

  const OtherProfileActionDisplay({
    super.key,
    required this.profileModel,
    required this.sendRequest,
    required this.unfriend,
  });

  @override
  OtherProfileActionDisplayState createState() =>
      OtherProfileActionDisplayState();
}

class OtherProfileActionDisplayState extends State<OtherProfileActionDisplay> {
  late String label;
  Icon? icon;
  Future<void> Function()? onTap;

  @override
  void initState() {
    super.initState();
    _setLabelAndIcon(widget.profileModel);
  }

  void _setLabelAndIcon(ProfileModel profileModel) {
    setState(() {
      switch (profileModel.connection) {
        case 'connected':
          label = 'Connected';
          icon = const Icon(Icons.check_rounded, size: 16.0);
          onTap = _confirmUnfriend; // Call the unfriend confirmation
          break;
        case 'pending':
          label = 'Pending';
          icon = const Icon(Icons.watch_later_outlined, size: 16.0);
          onTap = () async {};
          break;
        default:
          label = 'Connect';
          icon = const Icon(Icons.person_add_alt, size: 16.0);
          onTap = _sendFriendRequest;
      }
    });
  }

  Future<void> _sendFriendRequest() async {
    try {
      await widget.sendRequest();
      setState(() => _setLabelAndIcon(widget.profileModel)); // Update button state
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send friend request')),
      );
    }
  }

  Future<void> _confirmUnfriend() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 180.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Are you sure you want to unfriend this user?',
                style: TextStyle(
                  fontFamily: 'Sharp Grotesk',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: GlobalTheme.colors.textColor,
                      backgroundColor: GlobalTheme.colors.backgroundColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close popup
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: GlobalTheme.colors.textColor,
                      backgroundColor: GlobalTheme.colors.primaryColor,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop(); // Close popup
                      await _unfriend(); // Proceed with unfriend action
                    },
                    child: const Text('Unfriend'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _unfriend() async {
    try {
      await widget.unfriend();
      setState(() => _setLabelAndIcon(widget.profileModel)); // Update button state
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to unfriend')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton.icon(
          onPressed: onTap,
          style: FilledButton.styleFrom(
            foregroundColor: GlobalTheme.colors.textColor,
            backgroundColor: GlobalTheme.colors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.0),
              side: BorderSide(
                color: GlobalTheme.colors.textColor,
              ),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Sharp Grotesk',
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          label: Text(label),
          icon: icon ?? const Icon(Icons.person_add_alt),
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}
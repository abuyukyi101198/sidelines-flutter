import 'package:flutter/material.dart';
import 'package:sidelines/deprecated/widgets/buttons/link_button.dart';
import 'package:sidelines/widgets/badges/friend_badge.dart';
import '../../data/theme.dart';
import '../../models/profile_model.dart';

class FriendListItem extends StatelessWidget {
  final ProfileModel profileModel;

  const FriendListItem({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: GlobalTheme.colors.secondaryColor,
            image: profileModel.profilePictureUrl != null
                ? DecorationImage(
                    image: NetworkImage(profileModel.profilePictureUrl!)
                        as ImageProvider,
                    fit: BoxFit.cover)
                : null,
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        SizedBox(
          height: 42.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${profileModel.firstName} ${profileModel.lastName}',
                style: TextStyle(
                    color: GlobalTheme.colors.textColor, fontSize: 16.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FriendBadge(
                    label: profileModel.formatPosition(),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  FriendBadge(
                    label: 'Teammate',
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [LinkButton(onPressed: () {}, label: 'View Profile')],
          ),
        ),
      ],
    );
  }
}

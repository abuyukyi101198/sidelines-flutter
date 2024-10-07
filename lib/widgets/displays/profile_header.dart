import 'package:flutter/cupertino.dart';
import 'package:sidelines/data/theme.dart';
import 'package:sidelines/models/profile_model.dart';
import 'package:sidelines/widgets/badges/rating_badge.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profileModel;

  const ProfileHeader({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Container(
                width: 96.0,
                height: 96.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: GlobalTheme.colors.secondaryColor,
                  image: profileModel.profilePictureUrl != null
                      ? DecorationImage(
                          image: NetworkImage(profileModel.profilePictureUrl!)
                              as ImageProvider,
                          fit: BoxFit.contain)
                      : null,
                ),
              ),
              Positioned(
                bottom: -5,
                left: 210,
                child: RatingBadge(
                  overallRating: profileModel.overallRating!,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          '${profileModel.firstName} ${profileModel.lastName}',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: GlobalTheme.colors.primaryColor,
          ),
        ),
        Text(
          '@${profileModel.username}',
          style: TextStyle(color: GlobalTheme.colors.secondaryColor),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
